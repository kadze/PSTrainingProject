//
//  PSUser.m
//  IOSTrainingProject
//
//  Created by Сергей on 22.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSUser.h"

#import "NSString+PSExtensions.h"

static NSUInteger const kPSRandomNameSize   = 10;
static NSString * const kPSImageName        = @"Apple_core";
static NSString * const kPSImageType        = @"png";
static NSString * const kPSName             = @"name";

@interface PSUser ()
@property (nonatomic, strong)   UIImage *image;

@end

@implementation PSUser

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.name = [NSString randomStringFromSelfOfLength:kPSRandomNameSize];
    }
    
    return self;
}

#pragma mark -
#pragma mark PSModel

- (void)performLoading {
    sleep(3);
    static UIImage *__image = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = [[NSBundle mainBundle] pathForResource:kPSImageName ofType:kPSImageType];
        __image = [UIImage imageWithContentsOfFile:path];
    });
    
    self.image = __image;
    @synchronized(self) {
        self.state = kPSModelDidLoad;
    }
}

#pragma mark -
#pragma mark NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kPSName];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self) {
        self.name = [aDecoder decodeObjectForKey:kPSName];
    }
    
    return self;
}

@end
