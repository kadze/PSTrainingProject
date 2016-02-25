//
//  PSTableCell.m
//  IOSTrainingProject
//
//  Created by Сергей on 23.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSTableCell.h"

#import "PSUser.h"

@implementation PSTableCell

- (void)awakeFromNib {
    // Initialization code
}

#pragma mark -
#pragma mark Accessors

- (void)setUser:(PSUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark -
#pragma mark Public

- (void)fillWithModel:(PSUser *)user {
    self.label.text = user.name;
    self.userImageView.image = user.image;
}

@end
