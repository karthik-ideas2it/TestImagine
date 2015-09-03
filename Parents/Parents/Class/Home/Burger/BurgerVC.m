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
    [self.objBurgerView setupViewsWithFamilyCount:5];
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

@end
