//
//  testHelloWorld.m
//  sampleGoogleAnalytics
//
//  Created by Pollapee Sroysuwan on 1/16/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import <GHUnitIOS/GHUnitIOS.h>
#import "SayHelloWorld.h"

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

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

- (void)testMockito
{
    
    // mock creation
    NSArray *mockArray = mock([NSArray class]);
    
    // stubbing
    [given([mockArray objectAtIndex:0]) willReturn:@"first"];
    
    // following prints "(null)" because objectAtIndex:999 was not stubbed
    GHAssertEqualStrings([mockArray objectAtIndex:0], @"first", @"[mockArray objectAtIndex:0] didn't return first");
    
    [given(mockArray[0]) willReturn:@"first"];
    
    // following prints "(null)" because objectAtIndex:999 was not stubbed
    GHAssertEqualStrings(mockArray[0], @"first", @"mockArray[0] didn't return first");
}
@end
