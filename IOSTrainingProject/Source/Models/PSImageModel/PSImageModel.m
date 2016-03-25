//
//  PSImageModel.m
//  IOSTrainingProject
//
//  Created by Сергей on 3/21/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSImageModel.h"

#import "PSCache.h"
#import "PSDispatch.h"

#import "NSFileManager+PSExtensions.h"

#import "PSWeakifyMacros.h"
#import "PSReturnMacros.h"

@interface PSImageModel ()
@property (nonatomic, strong)   NSURL                       *url;
@property (nonatomic, strong)   UIImage                     *image;
@property (nonatomic, strong)   NSURLSession                *session;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *task;

@end

@implementation PSImageModel

@dynamic session;
@dynamic filePath;
@dynamic fileName;
@dynamic fileFolder;
@dynamic cached;

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
    self.task = nil;
}

- (instancetype)initWithUrl:(NSURL *)url {
    PSReturnNilIfNil(url);
    
    PSCache *imageCache = [[self class] cache];
    id imageModel = [imageCache objectForKey:url];
    
    if (imageModel) {
        return imageModel;
    }
    
    self = [super init];
    self.url = url;
    [imageCache addObject:self forKey:url];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

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

#pragma mark -
#pragma mark PSCachedModel

- (BOOL)isCached {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.filePath];
}

- (NSString *)filePath {
    return [self.fileFolder stringByAppendingPathComponent:self.fileName];
}

- (NSString *)fileFolder {
    return [NSFileManager userDocumentsPath];
}

- (NSString *)fileName {
    return self.url.lastPathComponent;
}

#pragma mark -
#pragma mark Public

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
    PSWeakify(self);
    PSDispatchSyncOnMainThread(^{
        PSStrongify(self);
        @synchronized(self) {
            self.state = self.image ? kPSModelDidLoad : kPSModelDidFailLoading;
        }
    });
}

#pragma mark -
#pragma mark Private

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
        [self loadImageFromInternet:completion];
    }
}

- (void)loadImageFromInternet:(void (^)(UIImage *image, id error))completion {
    PSWeakify(self);
    id block = ^(NSURL *location, NSURLResponse *response, NSError *error) {
        PSStrongifyAndReturnIfNil(self);
        UIImage *image = nil;
        if (!error) {
            NSURL *fileURL = [NSURL fileURLWithPath:self.filePath];
            image = [UIImage imageWithContentsOfFile:location.absoluteString];
            if (image) {
                [[NSFileManager defaultManager] copyItemAtURL:location toURL:fileURL error:&error];
            }
        }
        
        completion(image, error);
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
