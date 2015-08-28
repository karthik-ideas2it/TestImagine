//
//  ViewController.m
//  Parents
//
//  Created by Karthikeyan on 8/26/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ExploreVC.h"
#import "MessagesHomeVC.h"
#import "CommunityHomeVC.h"
#import "DashboardHomeVC.h"
#import "ShopHomeVC.h"

#import "HomeVC.h"
#import "LoginService.h"

@interface ViewController () <LoginServiceDelegate>
{
    LoginService *objLoginService;
}

@property (nonatomic, strong) NSString *strEmail;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [FBSDKProfile enableUpdatesOnAccessTokenChange:YES];

}
-(IBAction)FbLoginAction:(id)sender{
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:[NSString stringWithFormat:@"me"] parameters:@{@"fields": @"picture, email,gender,cover,birthday"}
                                           HTTPMethod:@"GET"]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 self.strEmail = [result valueForKeyPath:@"email"];
                 NSLog(@"%@",[[FBSDKAccessToken currentAccessToken] tokenString]);
                 [self LoadHomeView:nil];
                 
             }
         }];
    }
    else
    {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login logInWithReadPermissions:  @[@"public_profile", @"email", @"user_friends", @"user_birthday"]
                                handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
                                    if (error) {
                                        NSLog(@"Login error");
                                    } else if (result.isCancelled) {
                                        NSLog(@"Login Cancelled");
                                    } else {
                                        if ([FBSDKAccessToken currentAccessToken]) {
                                            [[[FBSDKGraphRequest alloc] initWithGraphPath:[NSString stringWithFormat:@"me"] parameters:@{@"fields": @"picture, email,gender,cover,birthday"}
                                                                               HTTPMethod:@"GET"]
                                             startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                                                 if (!error) {
                                                     NSLog(@"fetched user:%@", result);
                                                     self.strEmail = [result valueForKeyPath:@"email"];
                                                     NSLog(@"%@",[[FBSDKAccessToken currentAccessToken] tokenString]);
                                                     [self LoadHomeView:nil];
                                                     
                                                 }
                                             }];
                                        }
                                    }
                                }];
    }
}

-(IBAction)LoadHomeView:(id)sender{
    
    //    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"User ID :%@",    [[FBSDKProfile currentProfile] userID]);
    objLoginService = [[LoginService alloc] init];
    [objLoginService loginWithEmail:self.strEmail AccessToken:[[FBSDKAccessToken currentAccessToken] tokenString]UserID:[[FBSDKProfile currentProfile] userID]];
    
}

-(void)loginSuccessful
{
    
}

-(void)networkFailureWithError:(NSError *)error title:(NSString *)errorTitle
{
    NSLog(@"error %@",error);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
