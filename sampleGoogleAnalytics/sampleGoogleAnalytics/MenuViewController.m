//
//  MenuViewController.m
//  sampleGoogleAnalytics
//
//  Created by Pollapee Sroysuwan on 1/17/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import "MenuViewController.h"

#import "DetailViewController.h"

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

	//[[GANTracker sharedTracker] trackPageview:@"/MenuView" withError:nil];
	id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-36016647-2"];
	
	[tracker trackView:@"Menu View"];
	[tracker sendView:@"Menu View - send view"];
	
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20, 50, 100, 40);
	button.tag = 1;
	[button setTitle:@"Button A" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
	button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20, 100, 100, 40);
	button.tag = 2;
	[button setTitle:@"Button B" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonDidTouch:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonDidTouch:(id)sender
{
	NSString *label = @"Button A";
	NSInteger value = 1;
	
	if (((UIButton *)sender).tag == 2)
	{
		label = @"Button B";
		value = 2;
		
		id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-36016647-2"];
		[tracker sendEventWithCategory:@"Menu View" withAction:@"Button 2 Click" withLabel:@"Button 2" withValue:@2];
		/*
		[[GANTracker sharedTracker] trackTransactions:nil];
		[[GANTracker sharedTracker] trackEvent:@"button did touch"
										action:@"open detail view"
										 label:label
										 value:value
									 withError:nil];
		*/
		
		DetailViewController *con = [[[DetailViewController alloc] init] autorelease];
		[self presentViewController:con animated:YES completion:nil];
	}
	else
	{
		id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-36016647-2"];
		[tracker sendEventWithCategory:@"Menu View" withAction:@"Button 1 Click" withLabel:@"Button 1" withValue:@1];
		/*
		[[GANTracker sharedTracker] trackEvent:@"button did touch"
										action:@"button click"
										 label:label
										 value:value
									 withError:nil];
		 */
	}
}

@end
