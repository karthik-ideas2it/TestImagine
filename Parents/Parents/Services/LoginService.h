//
//  LoginService.h
//  Parents
//
//  Created by ideas2it on 8/28/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "AppSingleton.h"

@protocol BaseServiceDelegate <NSObject>

@optional
- (void)networkFailureWithError:(NSError*)error title:(NSString*)errorTitle;


@end

@protocol LoginServiceDelegate <BaseServiceDelegate>

-(void)loginSuccessful;

@optional
@end


@interface LoginService : NSObject
{
    AFHTTPSessionManager *objAFManager;
}
@property (nonatomic, strong) NSURLSession *networkSession;
@property (nonatomic, weak) id <LoginServiceDelegate> delegate;


-(void)loginWithEmail:(NSString*)email AccessToken:(NSString*)token UserID:(NSString*)userID;

@end
