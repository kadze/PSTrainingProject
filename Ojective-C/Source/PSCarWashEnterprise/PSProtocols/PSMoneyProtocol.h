//
//  PSMoney.h
//  PSTrainingProject
//
//  Created by Сергей on 21.12.15.
//  Copyright © 2015 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PSMoneyProtocol <NSObject>
@property (nonatomic, assign)   uint32_t    money;

- (void)takeMoney:(uint8_t)money fromMoneyKeeper:(id)moneyKeeper;

- (void)giveMoney:(uint8_t)money toMoneyKeeper:(id)moneyKeeper;

@end
