//
//  ExploreVC.m
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ExploreVC.h"

@interface ExploreVC ()

@end

@implementation ExploreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SetHeaderView{
    int x=50;
    int y=10;
    for (int i = 0; i<2; i++) {
        UIView *vw_thumbs=[[UIView alloc]init];
        
        [vw_thumbs setFrame:CGRectMake((i*70)+x, y, 70, 70)];
        
        [vw_thumbs.layer setCornerRadius:35];
        [vw_thumbs setBackgroundColor:[UIColor grayColor]];
        
        [scr_header addSubview:vw_thumbs];
        
    }
    
    
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
