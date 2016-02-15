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

PSViewControllerBaseViewProperty(PSSquareViewController, squareView, PSSquareView)

@implementation PSSquareViewController

#pragma mark -
#pragma mark Public

- (IBAction)onAnimateButton:(id)sender {
    PSSquareView *squareView = self.squareView;
    squareView.animating = !squareView.animating;
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
