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
static NSString * const kPSName             = @"name";
static NSString * const kPSImageURL         = @"http://s015.radikal.ru/i331/1603/f6/fa350a72997b.jpg";

@interface PSUser ()
@property (nonatomic, strong)   PSImageModel    *imageModel;

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
#pragma mark Accessors

- (PSImageModel *)imageModel {
    return [PSImageModel imageModelWithUrl:[NSURL URLWithString:kPSImageURL]];
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
