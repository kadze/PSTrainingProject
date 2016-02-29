//
//  PSSquareViewController.m
//  IOSTrainingProject
//
//  Created by Сергей on 03.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSSquareViewController.h"

#import "PSSquareView.h"
#import "UIViewController+PSExtensionsMacros.h"

PSViewControllerBaseViewProperty(PSSquareViewController, PSSquareView, areaView)

@implementation PSSquareViewController

#pragma mark -
#pragma mark Public

- (IBAction)onStartStopButton:(id)sender {
    PSSquareView *areaView = self.areaView;
    areaView.animation = !areaView.animation;
}

- (IBAction)onMoveButton:(id)sender {
    [self.areaView moveSquareToNextPosition];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
