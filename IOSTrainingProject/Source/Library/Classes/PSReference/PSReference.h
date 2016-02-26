//
//  PSReference.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/26/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSReference : NSObject <NSCopying>
@property (nonatomic, strong)   id  target;

- (instancetype)initWithTarget:(id)object;

@end
