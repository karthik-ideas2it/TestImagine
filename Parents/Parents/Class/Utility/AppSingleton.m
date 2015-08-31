//
//  AppSingleton.m
//  UberClone
//
//  Created by Sudarsanam on 19/08/15.
//  Copyright (c) 2015 Sudarsanam. All rights reserved.
//

#import "AppSingleton.h"

@implementation AppSingleton

+ (AppSingleton *)sharedInstance
{
    static dispatch_once_t _singleton;
    static AppSingleton *sharedInstance = nil;
    
    dispatch_once(&_singleton, ^{
        sharedInstance = [[super alloc] init];
    });
    return sharedInstance;
}


@end
