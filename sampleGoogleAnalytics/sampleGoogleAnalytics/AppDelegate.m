//
//  AppDelegate.m
//  sampleGoogleAnalytics
//
//  Created by Code BanBan on 1/16/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import "AppDelegate.h"
#import "MenuViewController.h"
#import "GANTracker.h"

static NSString *const kAnalyticsAccountId = @"UA-36016647-4";
static const NSInteger kDispatchPeriodSeconds = 10;

@implementation AppDelegate

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
	
	// add root viewcontoller
    MenuViewController* viewController = [[MenuViewController alloc] initWithNibName:@"MenuViewController" bundle:nil];
    self.window.rootViewController = viewController;
    
    [TestFlight setDeviceIdentifier:@"11"];
    // init testflight
    [TestFlight takeOff:@"d99b7c7d88b810fd71d165aaf1461077_MTc1MzEwMjAxMy0wMS0xNiAyMTozMTozNS44ODQzNzc"];
    
    [TestFlight passCheckpoint:@"application did finish launching"];
	
	
	// Optional: automatically send uncaught exceptions to Google Analytics.
	[GAI sharedInstance].trackUncaughtExceptions = YES;
	// Optional: set Google Analytics dispatch interval to e.g. 20 seconds.
	[GAI sharedInstance].dispatchInterval = 20;
	// Optional: set debug to YES for extra debugging information.
	[GAI sharedInstance].debug = YES;
	// Create tracker instance.
	id<GAITracker> tracker = [[GAI sharedInstance] trackerWithTrackingId:@"UA-36016647-2"];
	
	//==== Google analytics ===//
	/*
	[[GANTracker sharedTracker] startTrackerWithAccountID:kAnalyticsAccountId
										   dispatchPeriod:kDispatchPeriodSeconds
												 delegate:nil];
	
	NSError *error;
	if (![[GANTracker sharedTracker] setCustomVariableAtIndex:1
														 name:@"iPhone1"
														value:@"iv1"
													withError:&error])
	{
		NSLog(@"Error : setCustomVariableAtIndex");
	}
	
	if (![[GANTracker sharedTracker] trackEvent:@"my_category"
										 action:@"my_action"
										  label:@"my_label"
										  value:-1
									  withError:&error])
	{
		NSLog(@"Error : trackEvent");
	}
	
	if (![[GANTracker sharedTracker] trackPageview:@"/app_entry_point"
										 withError:&error])
	{
		NSLog(@"Error : trackPageview");
	}
    //*/
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -
#pragma mark GANTrackerDelegate methods

/*
- (void)hitDispatched:(NSString *)hitString {
	NSLog(@"Hit Dispatched: %@", hitString);
}

- (void)trackerDispatchDidComplete:(GANTracker *)tracker
                  eventsDispatched:(NSUInteger)hitsDispatched
              eventsFailedDispatch:(NSUInteger)hitsFailedDispatch {
	NSLog(@"Dispatch completed (%u OK, %u failed)",
		  hitsDispatched, hitsFailedDispatch);
}
*/

@end
