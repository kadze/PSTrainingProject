//
//  PSMoney.h
//  PSTrainingProject
//
//  Created by Сергей on 21.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSMoneyProtocol <NSObject>

@property (nonatomic, assign)   NSUInteger  money;

- (void)takeMoney:(NSUInteger)money fromMoneyKeeper:(id)moneyKeeper;
- (void)giveMoney:(NSUInteger)money toMoneyKeeper:(id)moneyKeeper;

- (void)takeMoney:(NSUInteger)money;
- (void)giveMoney:(NSUInteger)money;

@end
