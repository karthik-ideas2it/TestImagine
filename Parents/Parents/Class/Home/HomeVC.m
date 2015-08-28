//
//  Home.m
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "HomeVC.h"

#import "ExploreVC.h"
#import "MessagesHomeVC.h"
#import "CommunityHomeVC.h"
#import "DashboardHomeVC.h"
#import "ShopHomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 1.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    UIImageView *img=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"BottomBar.png"]];
    [img setFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
    
    [self.tabBar addSubview:img];
    
    [self.tabBar setTintColor:[UIColor whiteColor]];
    [self.tabBar setSelectionIndicatorImage:nil];
    
    CGContextFillRect(context, rect);
    UIImage *transparentImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar.layer setBorderWidth:0.0];
    [self.tabBar setBackgroundImage:transparentImage];
    [self.tabBar setShadowImage:transparentImage];
    //    self.tabBar.alpha = 0.0;
    
    
    UITabBar *tabBar = self.tabBar;
    NSArray *images_def=@[@"Explore_icon.png",@"Comm_icon.png",@"Dash_icon.png",@"Messages_icon.png",@"Shop_icon.png"];
    NSArray *images_sel=@[@"selection.png",@"selection.png",@"selection.png",@"selection.png",@"selection.png"];
    for (int i=0; i<5; i++) {
        UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:i];
        UIImage *iconBoxOffice = [UIImage imageNamed:[images_def objectAtIndex:i]];
        UIImage *selectedIconBoxOffice = [UIImage imageNamed:[images_sel objectAtIndex:i]];
        [tabBarItem1 setImage:[iconBoxOffice imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabBarItem1 setSelectedImage:[selectedIconBoxOffice imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        tabBarItem1.imageInsets = UIEdgeInsetsMake(0, 0,0, 0);
    }
    
    //    [item0 initWithTitle:@"Box Office" image:iconBoxOffice selectedImage:selectedIconBoxOffice];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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
