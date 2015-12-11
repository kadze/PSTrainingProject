//
//  PSMoney.h
//  PSTrainingProject
//
//  Created by Сергей on 10.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSMoney : NSObject

@property (nonatomic, readonly) NSNumber    *money;

+ (instancetype)createWithMoney:(NSNumber *)money;
- (void)receivingMoney;

@end
