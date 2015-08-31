//
//  AppSingleton.h
//  UberClone
//
//  Created by Sudarsanam on 19/08/15.
//  Copyright (c) 2015 Sudarsanam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppSingleton : NSObject

+ (AppSingleton *)sharedInstance;

@property (nonatomic, strong) NSString *authorizationToken;

@end
