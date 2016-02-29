//
//  UINib+PSExtensions.h
//  IOSTrainingProject
//
//  Created by Сергей on 2/29/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (PSExtensions)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls owner:(id)owner;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls owner:(id)owner;

- (NSArray *)objects;
- (NSArray *)objectsWithOwner:(id)ownerOrNil;

@end
