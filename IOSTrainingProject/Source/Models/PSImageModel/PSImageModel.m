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

#import "PSWeakifyMacros.h"

@interface PSImageModel ()
@property (nonatomic, strong)   NSURL       *url;
@property (nonatomic, strong)   UIImage     *image;
@property (nonatomic, readonly) NSArray     *notificationNames;

@end

@implementation PSImageModel

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

#pragma mark -
#pragma mark Public

- (void)dump {
    self.image = nil;
    self.state = kPSModelUnloaded;
}

- (void)performLoadingWithCompletion:(void(^)(UIImage *image, id error))completion {
    
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
