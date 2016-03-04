//
//  PSModel.h
//  IOSTrainingProject
//
//  Created by Сергей on 3/4/16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSObservableObject.h"

typedef NS_ENUM(NSUInteger, PSModelState) {
    kPSModelNotLoaded,
    kPSModelWillLoad,
    kPSModelDidFailLoading,
    kPSModelDidLoad,
    kPSModelDidChange
};

@interface PSModel : PSObservableObject

- (void)load;

@end
