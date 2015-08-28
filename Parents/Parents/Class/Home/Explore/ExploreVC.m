//
//  ExploreVC.m
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ExploreVC.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+AFNetworking.h>

@interface ExploreVC ()

@end

@implementation ExploreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self DownloadImageFromS3];
    
      // Do any additional setup after loading the view.
}
-(void)viewWillLayoutSubviews{
    [self SetHeaderView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SetHeaderView{
    int x=10;
    int y=10;
    for (int i = 0; i<3; i++) {
        UIView *vw_thumbs=[[UIView alloc]init];
        
        [vw_thumbs setFrame:CGRectMake((i*90)+x, y, 70, 70)];
        
        [vw_thumbs.layer setCornerRadius:35];
        [vw_thumbs setBackgroundColor:[UIColor grayColor]];

        [scr_header addSubview:vw_thumbs];
        [scr_header setContentSize:CGSizeMake((i*100 )+100, 70)];
        
    }
    [scr_header setPagingEnabled:YES];
    
   [scr_header setFrame:CGRectMake((self.view.frame.size.width/2)-35 , scr_header.frame.origin.y, 90, 90)];
    [tbl_exlpore setFrame:CGRectMake(tbl_exlpore.frame.origin.x, vw_header.frame.size.height+vw_header.frame.origin.y, self.view.frame.size.width, tbl_exlpore.frame.size.height)];
      
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    [tableView setBackgroundColor:[UIColor clearColor]];
    [tableView setBackgroundView:nil];
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSArray *celSubview=[cell.contentView subviews];
    for (id obj in celSubview) {
        if([obj isKindOfClass:[UICollectionView class]])
        {
            UICollectionView *collView=(UICollectionView *)obj;
            collView.tag=indexPath.section;
        }
    }
    return cell;
}
-(double)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}
-(double)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case 0:
            return 240;
            break;
        case 1:
            return 120;
            break;
        case 2:
            return 100;
            break;
        default:
            break;
    }
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vw_tblheader=[[UIView alloc]init];
    
    [vw_tblheader setBackgroundColor:[UIColor clearColor]];
    
    UIView *bg_header=[[UIView alloc]init];
    [bg_header setBackgroundColor:[UIColor colorWithRed:246/255.0 green:137/255.0 blue:37/255.0 alpha:1]];
    
    [bg_header setFrame:CGRectMake(-15, 6, 180, 38)];
    
    [bg_header.layer setCornerRadius:(bg_header.frame.size.height/2)];
    
    
    UILabel *lbl_header=[[UILabel alloc]init];
    switch (section) {
        case 0:
                [lbl_header setText:@"Discover"];
                break;
            case 1:
                [lbl_header setText:@"Recomended"];
            break;
        case 2:
                [lbl_header setText:@"Event Planner"];
            break;
        default:
            break;
    }

    [lbl_header setFont:[UIFont systemFontOfSize:14]];
    [lbl_header setTextColor:[UIColor whiteColor]];
    [lbl_header setTextAlignment:NSTextAlignmentRight];
    
    
    [lbl_header setFrame:CGRectMake(10, 10, 130, 25)];
    [vw_tblheader addSubview:bg_header];
    
    [vw_tblheader addSubview:lbl_header];
    
    return vw_tblheader;
    
}

#pragma mark Collection View - for every section

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    [collectionView setBackgroundView:nil];
    [collectionView setBackgroundColor:[UIColor clearColor]];
    
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
  __weak  UIImageView *img=(UIImageView*)[cell viewWithTag:10];
    switch (collectionView.tag) {
        case 0:
        {
            NSURL *url = [NSURL URLWithString:@"https://imagin8ors-dev.s3-us-west-2.amazonaws.com/test/explore.png"];
            NSURLRequest *request = [NSURLRequest requestWithURL:url];

            [img setImageWithURLRequest:request
                                  placeholderImage:[UIImage imageNamed:@"Explore.png"]
                                           success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                               
                                               [img setImage: image];
                                               [img setNeedsLayout];
                                               } failure:nil];
        }
            break;
            
        case 1:
            [img setImage:[UIImage imageNamed:@"recomend.png"]];
            break;
        case 2:
            [img setImage:[UIImage imageNamed:@"EventPlaner.png"]];
            break;
        default:
            break;
    }
    [cell.layer setCornerRadius:10];
    
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case 0:
    return CGSizeMake(240, 240);
            break;
            case 1:
                return CGSizeMake(200, 120);
            break;
        case 2:
            return CGSizeMake(260, 100);
            break;
        default:
            break;
    }
    return CGSizeMake(0, 0);
}
#pragma mark DownloadImages
-(UIImage*)DownloadImageFromS3{
    UIImage *img_thumb;
    NSString *str=@"https://imagin8ors-dev.s3-us-west-2.amazonaws.com/test/explore.png";
    NSString *fileName=[[str componentsSeparatedByString:@"/"] lastObject];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
    img_thumb = [UIImage imageNamed:path];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfully downloaded file to %@", path);
        UIImage *img_thumb=[UIImage imageNamed:path];
        [tbl_exlpore reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [operation start];
    
    
    return img_thumb;
    
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
