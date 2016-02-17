//
//  PSSquareViewController.m
//  IOSTrainingProject
//
//  Created by Сергей on 03.02.16.
//  Copyright © 2016 Сергей. All rights reserved.
//

#import "PSSquareViewController.h"
#import "PSSquareView.h"
#import "PSMacros.h"

PSViewControllerBaseViewProperty(PSSquareViewController, areaView, PSSquareView)

@implementation PSSquareViewController

#pragma mark -
#pragma mark Public

- (IBAction)onStartStopButton:(id)sender {
    PSSquareView *areaView = self.areaView;
    areaView.animating = !areaView.animating;
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
