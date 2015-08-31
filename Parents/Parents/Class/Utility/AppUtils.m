//
//  AppUtils.m
//  Parents
//
//  Created by Karthikeyan on 8/31/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "AppUtils.h"
#import "Config.h"
@implementation AppUtils

+(void)showAlertMessage:(NSString *)Message inView:(UIViewController *)PresentingView{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:APP_NAME
                                          message:Message
                                          preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *DismissAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Dismiss", @"Dismiss action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Dismiss action");
                                   }];
    
    
    [alertController addAction:DismissAction];
    [PresentingView presentViewController:alertController animated:YES completion:nil];
    

}

@end
