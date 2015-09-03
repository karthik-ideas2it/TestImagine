//
//  BurgerVC.m
//  Parents
//
//  Created by ideas2it on 9/3/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "BurgerVC.h"

@interface BurgerVC ()

@end

@implementation BurgerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btnContactUs.layer setCornerRadius:25];
    [self.btnFAQ.layer setCornerRadius:25];
    [self.objBurgerView setupViewsWithFamilyCount:4];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnFAQTapped:(id)sender {
}

- (IBAction)btnContactUsTapped:(id)sender {
}

- (IBAction)btnCloseTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btnLikeTapped:(id)sender {
}

- (IBAction)btnCalendarTapped:(id)sender {
}

- (IBAction)btnNotificationTapped:(id)sender {
}
@end
