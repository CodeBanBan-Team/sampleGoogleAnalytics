//
//  SayHelloWorld.m
//  sampleGoogleAnalytics
//
//  Created by Pollapee Sroysuwan on 1/16/56 BE.
//  Copyright (c) 2556 Code BanBan. All rights reserved.
//

#import "SayHelloWorld.h"

@implementation SayHelloWorld

- (bool) sayHelloWorld:(bool)_needToSay
{
    if(_needToSay == NO)
    {
        return NO;
    }
    
    NSLog(@"Hello,World");
    
    return YES;
}
@end
