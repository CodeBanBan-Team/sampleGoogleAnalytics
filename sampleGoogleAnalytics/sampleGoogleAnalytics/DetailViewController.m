//
//  DetailViewController.m
//  sampleGoogleAnalytics
//
//  Created by Code BanBan on 1/17/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
	
	self.view.backgroundColor = [UIColor magentaColor];
	
	UILabel *label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
	label.text = @"Hello Detail View....";
	label.textAlignment = NSTextAlignmentCenter;
	[self.view addSubview:label];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20, 50, 100, 40);
	button.tag = 1;
	[button setTitle:@"Close" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonDidTouch) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	[[GANTracker sharedTracker] trackPageview:@"/DetailView" withError:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidTouch
{
	[[GANTracker sharedTracker] trackEvent:@"button did touch"
									action:@"close page"
									 label:@"Close"
									 value:1
								 withError:nil];
	
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end
