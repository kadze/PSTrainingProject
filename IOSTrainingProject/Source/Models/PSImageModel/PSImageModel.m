//
//  PSImageModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSImageModel.h"

#import "PSCache.h"
#import "PSUsers.h"

#import "PSDispatch.h"

#import "PSWeakifyMacros.h"

@interface PSImageModel ()
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;
@property (nonatomic, readonly) NSString                    *filePath;

@property (nonatomic, readonly, getter=isCached)    BOOL    cached;

@end

@implementation PSImageModel

@dynamic session;
@dynamic filePath;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)imageModelWithUrl:(NSURL *)url {
    return [[self alloc] initWithUrl:url];
}

+ (PSCache *)cache {
    return [PSCache cache];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    [self unsubcribeFromAplicationNotifications:self.notificationNames];
}

- (instancetype)initWithUrl:(NSURL *)url {
    if (!url) {
        return nil;
    }
    
    PSCache *imageCache = [PSImageModel cache];
    id imageModel = [imageCache objectForKey:url];
    
    if (imageModel) {
        return imageModel;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        [imageCache addObject:self forKey:url];
        [self subscribeToAplicationNotifications:self.notificationNames];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)notificationNames {
    return @[UIApplicationDidReceiveMemoryWarningNotification];
}

- (NSURLSession *)session {
    static NSURLSession *__session = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration ephemeralSessionConfiguration];
        __session = [NSURLSession sessionWithConfiguration:configuration];
    });
    
    return __session;
}

- (void)setTask:(NSURLSessionDownloadTask *)task {
    if (_task != task) {
        [_task cancel];
        _task = task;
        [_task resume];
    }
}

- (NSURLRequest *)request {
    return [NSURLRequest requestWithURL:self.url];
}

#pragma mark -
#pragma mark Public

- (void)dump {
    self.image = nil;
    self.state = kPSModelUnloaded;
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
    PSWeakify(self);
    PSDispatchAsyncOnMainThread(^{
        PSStrongify(self);
        
        self.state = self.image ? kPSModelDidLoad : kPSModelDidFailLoading;
    });
}

#pragma mark -
#pragma mark Private

- (void)subscribeToAplicationNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter addObserver:self
                             selector:@selector(dumpWithNotification:)
                                 name:notification
                               object:nil];
    }
}

- (void)unsubcribeFromAplicationNotifications:(NSArray *)notifications {
    NSNotificationCenter *noticationCenter = [NSNotificationCenter defaultCenter];
    
    for (id notification in notifications) {
        [noticationCenter removeObserver:self name:notification object:nil];
    }
    
}

- (void)dumpWithNotification:(id)notification {
    [self dump];
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    if (self.cached) {
        [self loadImageFromDisk:completion];
    } else {
        [self loadImageFromInternet:completion];
    }
}

- (void)loadImageFromDisk:(void (^)(UIImage *image, id error))completion {
    UIImage *image = [UIImage imageWithContentsOfFile:self.filePath];
    
    if (!image) {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSError *error = nil;
        
        [fileManager removeItemAtPath:self.filePath error:&error];
    }
    
    completion(image, nil);
}

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion {
    PSWeakify(self);
    id block = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        PSStrongifyAndReturnIfNil(self);
        if (!error) {
            NSURL *fileURL = [NSURL fileURLWithPath:self.filePath];
            
            [[NSFileManager defaultManager] copyItemAtURL:location toURL:fileURL error:nil];
            [self performLoadingWithCompletion:completion];
        }
    };
    
    self.task = [self.session downloadTaskWithURL:self.url completionHandler:block];
}

#pragma mark -
#pragma mark PSModel

- (void)performLoading {
    PSWeakify(self);
    [self performLoadingWithCompletion:^(UIImage *image, id error) {
        PSStrongify(self);
        
        [self finalizeLoadingWithImage:image error:error];
        [self notifyOfLoadingStateWithImage:image error:error];
    }];
}

@end
