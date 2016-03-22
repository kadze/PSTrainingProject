//
//  PSUserCell.h
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PSView.h"

@class PSImageView;

@class PSUser;

@interface PSUserCell : UITableViewCell
@property (nonatomic, strong)   IBOutlet    UILabel         *label;
@property (nonatomic, strong)   IBOutlet    PSImageView     *userImageView;
//@property (nonatomic, strong)   IBOutlet    PSView          *loadingView;

@property (nonatomic, strong)   PSUser    *user;

@end
