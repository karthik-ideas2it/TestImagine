//
//  ExploreVC.m
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//
/*
 Explore VC class is equiped with table and collection views. the collection view is loaded in every row of the tableview to providing the user to flexibally scroll in both the ways .
 where the every row in the list is equped with multiple items which needs horizontal scrolling

 */
#import "ExploreVC.h"
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
#import "AppUtils.h"

//Model Classes
/* RecomendationBaseClass is the model class. it was created based on the
 response from the recomendation API. The model is generated using the
 JSON accelerator application
 
 */
#import "RecomendationBaseClass.h"
#import "ExploreDataModel.h"
UIButton *selectedChild;
@interface ExploreVC ()

@end

@implementation ExploreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Fetch the information from server in the background
    // AF uses the operation que, so by default the operation will be handled in the background
    [self loadInformationFromServer];
    
}
-(void)viewWillLayoutSubviews{
    [self SetHeaderView];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SetHeaderView{
    int x=100;
    int y=0;
    for (int i = 0; i<3; i++) {
        UIView *vw_thumbs=[[UIView alloc]init];
        // x denotes the initial skip region
        [vw_thumbs setFrame:CGRectMake(x + (i*115), y, 115, 115)];
        [vw_thumbs setBackgroundColor:[UIColor clearColor]];
        //Profile Image of children

        UIButton *button_image=[[UIButton alloc]init];
        [button_image setImage:[UIImage imageNamed:@"avatar.png"]forState:UIControlStateNormal];
        [button_image setFrame:CGRectMake(10, 10, 95, 95)];
        [button_image.layer setCornerRadius:button_image.frame.size.height/2];
        [button_image setContentMode:UIViewContentModeScaleAspectFill];
        [button_image setClipsToBounds:YES];
        [button_image setTag:13+i];
        [button_image addTarget:self action:@selector(FilterExploreData:) forControlEvents:UIControlEventTouchUpInside];
        [vw_thumbs addSubview:button_image];
        [scr_header addSubview:vw_thumbs];
        [scr_header setContentSize:CGSizeMake((i*115 )+400, 115)];
        
    }
    [scr_header setPagingEnabled:NO];
    
//   [scr_header setFrame:CGRectMake((self.view.frame.size.width/2)-35 , scr_header.frame.origin.y, 90, 90)];
    [tbl_exlpore setFrame:CGRectMake(tbl_exlpore.frame.origin.x, vw_header.frame.size.height+vw_header.frame.origin.y-20, self.view.frame.size.width, tbl_exlpore.frame.size.height)];
      
}
-(void)FilterExploreData:(UIButton *)sender{
    if(selectedChild==nil)
        selectedChild=sender;
    if(selectedChild !=nil)
    {
        // Resizing the previous selected button to un slected state
        // before assigning the new sleection, the existing is considered as old one and its properties are updated
        CGRect frame=selectedChild.frame;
        frame.origin.x=10;
        frame.origin.y=10;
        frame.size.height=95;
        frame.size.width=95;
        [selectedChild setFrame:frame];
        [selectedChild.layer setCornerRadius:selectedChild.frame.size.height/2];
        [selectedChild.layer setBorderWidth:1.0];

        selectedChild=sender;
        // Enlarging the selected image a bit higher for identification
        // The selected child willnow holds the newely selected button

        frame=selectedChild.frame;
        frame.origin.x=7;
        frame.origin.y=7;
        frame.size.height=100;
        frame.size.width=100;
        
        
        [selectedChild setFrame:frame];
        [selectedChild.layer setCornerRadius:selectedChild.frame.size.height/2];

        [selectedChild.layer setBorderWidth:6.0];
        [selectedChild.layer setBorderColor:[UIColor whiteColor].CGColor];
        
    }
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
            return 260;
            break;
        case 1:
            return 135;
            break;
        case 2:
            return 120;
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
    
    [bg_header setFrame:CGRectMake(-21, 6, 151, 42)];
    
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

    [lbl_header setFont:[UIFont systemFontOfSize:12]];
    [lbl_header setTextColor:[UIColor whiteColor]];
    [lbl_header setTextAlignment:NSTextAlignmentRight];
    
    [lbl_header setFrame:CGRectMake(0, 13, 118, 25)];
    [vw_tblheader addSubview:bg_header];
    
    [vw_tblheader addSubview:lbl_header];
    
    return vw_tblheader;
    
}

#pragma mark Collection View - for every category

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    [collectionView setBackgroundView:nil];
    [collectionView setBackgroundColor:[UIColor clearColor]];
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];;
    
    
    if(cell != nil)
    {
  
    switch (collectionView.tag) {
        case 0:
        {
            cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"CollectionCell" forIndexPath:indexPath];
            
            //header text
            [(UILabel *)[[cell viewWithTag:1] viewWithTag:13] setText:[NSString stringWithFormat:@"Expert talk by Sam Adams"]];
            
            // Description Text
            [(UILabel *)[[cell viewWithTag:1] viewWithTag:14] setText:[NSString stringWithFormat:@"Keep an eye out for developmental milestones for your little one "]];
            
            __weak  UIImageView *img=(UIImageView*)[[cell viewWithTag:1] viewWithTag:10];
            // FETCH THE IMAGE FROM REMOTE,, BUT IT GENERATES REQUEST EVERY TIME, IT NEED TO BE HANDLED
//            NSURL *url = [NSURL URLWithString:@"https://imagin8ors-dev.s3-us-west-2.amazonaws.com/test/explore.png"];
//            NSURLRequest *request = [NSURLRequest requestWithURL:url];
//            [img setImageWithURLRequest:request
//                       placeholderImage:[UIImage imageNamed:@"Explore.png"]
//                                success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//                                               [img setImage: image];
//                                               [img setNeedsLayout];
//                                               } failure:nil];
        }
            break;
        case 1:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RecomendedCell" forIndexPath:indexPath];
            
            //Price display
            [[[cell viewWithTag:1]viewWithTag:13].layer setCornerRadius:3];
            [(UILabel *)[[[cell viewWithTag:1]viewWithTag:13] viewWithTag:1] setText:[NSString stringWithFormat: @"%@ %@",@"$",@"1,99"]];
            
            // Description Text
            [(UILabel *)[[cell viewWithTag:1] viewWithTag:11] setText:[NSString stringWithFormat:@"Make Your Own Autobot"]];
            
            // Experience or activity
            [[[cell viewWithTag:1] viewWithTag:12].layer setCornerRadius:2];
            [(UILabel *)[[[cell viewWithTag:1] viewWithTag:12] viewWithTag:1] setText:[NSString stringWithFormat:@"Activity"]];
            
            //Bg image
            UIImageView *img_bg=(UIImageView *)[[cell viewWithTag:1] viewWithTag:10];
            [img_bg setImage:[UIImage imageNamed:@"recomend.png"]];
            
            
            
        }
            break;
        case 2:
        {
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"EventCell" forIndexPath:indexPath];
            // Date / month display
            [[(UIView *)[cell viewWithTag:1] viewWithTag:5].layer setCornerRadius:5];
            //Date
            [(UILabel *)[[[cell viewWithTag:1] viewWithTag:5] viewWithTag:1] setText:[NSString stringWithFormat:@"25"]];
            //Month
            [(UILabel *)[[[cell viewWithTag:1] viewWithTag:5] viewWithTag:2] setText:[NSString stringWithFormat:@"SEP"]];
            
            // Description Text
            [(UILabel *)[[cell viewWithTag:1] viewWithTag:11] setText:[NSString stringWithFormat:@"Exploration at the science Museum"]];
            // Location Text
            [(UILabel *)[[cell viewWithTag:1] viewWithTag:12] setText:[NSString stringWithFormat:@"Singapore"]];

            //Bg image
            UIImageView *img_bg=(UIImageView *)[[cell viewWithTag:1] viewWithTag:10];
            [img_bg setImage:[UIImage imageNamed:@"EventPlaner.png"]];
        }
            break;
        default:
            break;
    }
        [cell setClipsToBounds:YES];
    [cell.layer setCornerRadius:10];
        
    }
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case 0:
    return CGSizeMake(310, 240);
            break;
            case 1:
                return CGSizeMake(180, 115);
            break;
        case 2:
            return CGSizeMake(310, 100);
            break;
        default:
            break;
    }
    return CGSizeMake(0, 0);
}
#pragma mark DownloadImages
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - Server Communiccation

-(void)loadInformationFromServer{
    
    NSString *string = [NSString stringWithFormat:@"http://192.168.0.36:8080/RESTServices/recommendations"];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    if([[AFNetworkReachabilityManager sharedManager] isReachable])
    {
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFJSONResponseSerializer serializer];
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"%@",responseObject);
            [tbl_exlpore reloadData];
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Recommendations"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }];
        
        [operation start];
    }
    else
    {
//        [AppUtils showAlertMessage:@"Server not Reachable " inView:self];
        
    }
}

@end
