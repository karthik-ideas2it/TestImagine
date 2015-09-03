//
//  LoginService.m
//  Parents
//
//  Created by ideas2it on 8/28/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "LoginService.h"

#define BASE_URL @"http://192.168.0.36:8080/"


@implementation LoginService

-(instancetype)init
{
    self = [super init];
    if (self) {
        //        objAFManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:BASE_URL]];
        //        NSLog(@"%@",objAFManager.requestSerializer);
        //        [objAFManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
        NSURLSessionConfiguration *objSessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
        _networkSession = [NSURLSession sessionWithConfiguration:objSessionConfig delegate:nil delegateQueue:nil];
    }
    return self;
}

-(void)loginWithEmail:(NSString *)email AccessToken:(NSString *)token UserID:(NSString *)userID
{
    NSDictionary *bodyParams = @{@"email" : email,
                                 @"secretToken" : token,
                                 @"userid" : userID,
                                 @"secretKey" : @"asdfg"};
    //    [objAFManager POST:@"RESTServices/user" parameters:bodyParams success:^(NSURLSessionDataTask *task, id responseObject) {
    //
    //    } failure:^(NSURLSessionDataTask *task, NSError *error) {
    //        NSLog(@"error %@",error);
    //    }];
    //    NSURL *url = [NSURL URLWithString:BASE_URL];
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //    [request setValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    //    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:bodyParams options:NSJSONWritingPrettyPrinted error:nil]];
    //    // 2
    //    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    //    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    //
    //    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    //
    //    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //
    //        // 4
    //     }];
    //
    //    // 5
    //    [operation start];
    
    NSMutableURLRequest *signInRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@RESTServices/user",BASE_URL]]];
    signInRequest.HTTPMethod = @"POST";
    [signInRequest setValue:@"application/json" forHTTPHeaderField:@"content-type"];
    NSError *jsonError;
    NSData *jsonBodyData = [NSJSONSerialization dataWithJSONObject:bodyParams options:0 error:&jsonError];
    if (!jsonError) {
        signInRequest.HTTPBody = jsonBodyData;
    }
    
    NSURLSessionDataTask *objPatientDetailsTask = [self.networkSession dataTaskWithRequest:signInRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if(!error)
        {
            if([(NSHTTPURLResponse*)response statusCode] == 200)
            {
                NSError *jsonError;
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
                id responseDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                NSLog(@"\n---------- Response -----------------\n----------Response Details----------\n%@\n--------JSON------------\n%@",httpResponse,responseDict);
                [[AppSingleton sharedInstance] setAuthorizationToken:[responseDict valueForKeyPath:@"returnToken"]];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.delegate loginSuccessful];
                });
                
            }
        }
        else
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate networkFailureWithError:error title:nil];
            });
            
        }
        
    }];
    [objPatientDetailsTask resume];
}

@end
