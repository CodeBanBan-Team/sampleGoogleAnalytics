//
//  testHelloWorld.m
//  sampleGoogleAnalytics
//
//  Created by Pollapee Sroysuwan on 1/16/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import "SayHelloWorld.h"

@interface testHelloWorld : GHTestCase
{
    SayHelloWorld* mHello;
}
@end



@implementation testHelloWorld

- (void) setUp
{
    [super setUp];
    
    mHello = [[SayHelloWorld alloc] init];
    [mHello retain];
}

- (void) tearDown
{
    [super tearDown];
    
    if(mHello)
    {
        [mHello release];
        mHello = nil;
    }
}

- (void) testHelloWorld
{
    bool sayResult = [mHello sayHelloWorld:YES];
    GHAssertTrue(sayResult, @"sayHelloWorld return NO, It should be YES.");
    
    sayResult = [mHello sayHelloWorld:NO];
    GHAssertFalse(sayResult, @"sayHelloWorld return YES, It should be NO.");
    
}
@end
