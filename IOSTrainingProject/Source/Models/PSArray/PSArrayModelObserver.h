//
//  PSArrayModelObserver.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/3/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSArrayModelObserver <NSObject>

@optional
- (void)collection:(id)collection changeWithModel:(id)changeModel;

@end
