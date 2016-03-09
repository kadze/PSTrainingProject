//
//  PSModelProtocol.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSModelObserver <NSObject>

@optional
- (void)modelWillLoad:(id)model;
- (void)modelDidFailLoading:(id)model;
- (void)modelDidLoad:(id)model;
- (void)model:(id)model didChangeWithObject:(id)object;

@end

