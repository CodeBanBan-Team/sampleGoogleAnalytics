//
//  MenuViewController.m
//  sampleGoogleAnalytics
//
//  Created by Pollapee Sroysuwan on 1/17/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [TestFlight passCheckpoint:@"Testflight menu viewcontroller did load."];
    
     [TestFlight openFeedbackView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
