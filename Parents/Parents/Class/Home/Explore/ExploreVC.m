//
//  ExploreVC.m
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//
/*
 Explore VC class is equiped with table and collection views. the collection view is loaded in every row of the tableview to providng the user to flexibally scroll in both the ways .
 where the every row in the list is equped with multiple items which needs horizontal scrolling

 */
#import "ExploreVC.h"

#import "AppUtils.h"
#import "Config.h"

#import <AFNetworking/AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import <AFNetworking/AFNetworking.h>

//Model Classes
/* RecomendationBaseClass is the model class. it was created based on the response from the recomendation API. The model is generated using the JSON accelerator application
 */
#import "RecomendationBaseClass.h"
#import "ExploreListVC.h"
UIButton *selectedChild;
        CGRect OldFrame,CenterFrame;
UIView *SelectedObject;

@interface ExploreVC ()

@end

@implementation ExploreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetHeaderView];

    // Fetch the information from server in the background
    // AF uses the operation que, so by default the operation will be handled in the background
//    [self loadInformationFromServer];
    
}

-(void)viewWillLayoutSubviews{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)SetHeaderView{
    NSArray *ChildNames=@[@"Sara",@"Jack",@"John"];
    
    float x=((self.view.frame.size.width - 300)/2);  // initial Skip region
    int y=32;   // Initial y position
    for (int i = 0; i<[ChildNames count]; i++) {
        //Profile Image of children
        
        NSData *archivedViewData = [NSKeyedArchiver archivedDataWithRootObject: [scr_header viewWithTag:2]];
        UIView *clone = (UIView *)[NSKeyedUnarchiver unarchiveObjectWithData:archivedViewData];
        [clone setHidden:NO];
        
        [clone setFrame:CGRectMake(x + (i*100), y, clone.frame.size.width  , clone.frame.size.height)];
        [(UIButton *)[clone viewWithTag:22] addTarget:self action:@selector(FilterExploreData:) forControlEvents:UIControlEventTouchUpInside];
        [((UIImageView *)[clone viewWithTag:21]).layer  setCornerRadius:30];
        [(UILabel *)[clone viewWithTag:20] setText:[NSString stringWithFormat:@"%@",[ChildNames objectAtIndex:i]]];
        
        [scr_header addSubview:clone];
        if(i==1) {SelectedObject = clone; CenterFrame = SelectedObject.frame; }
//        [scr_header setContentSize:CGSizeMake((i*114 )+400, 114)];
        
    }
    [scr_header setPagingEnabled:NO];
    
    [tbl_exlpore setFrame:CGRectMake(tbl_exlpore.frame.origin.x, vw_header.frame.size.height+vw_header.frame.origin.y, self.view.frame.size.width, tbl_exlpore.frame.size.height)];
      
}
-(IBAction)FilterExploreData:(UIButton *)sender{
    
    OldFrame = [[sender superview] viewWithTag:21].frame;
    UIView *curView=[sender superview];
    CGRect tFrame = curView.frame;
    // Moving the center object to the selected object location
    [curView setFrame:((UIView *)SelectedObject).frame];
    UIView *parentView = SelectedObject;
    UIImageView *img_avatar = (UIImageView *)[parentView viewWithTag:21];
    [img_avatar setFrame:OldFrame];
    [img_avatar.layer setCornerRadius:img_avatar.frame.size.height/2];
    [img_avatar.layer setBorderWidth:0];
    [parentView setFrame:CGRectMake(parentView.frame.origin.x, 32, parentView.frame.size.width, parentView.frame.size.height)];
    

    // Moving the object to center , and changing theimage style
    [SelectedObject setFrame:tFrame];
 // Selected object holds the Current selcted object
    SelectedObject = curView;
    
    parentView = SelectedObject;
    img_avatar = (UIImageView *)[parentView viewWithTag:21];
    [img_avatar.layer setBorderWidth:5.0];
    [img_avatar.layer setBorderColor:[UIColor whiteColor].CGColor];
    [img_avatar setFrame:CGRectMake(15, 36, 70, 70)];
    [img_avatar.layer setCornerRadius:img_avatar.frame.size.height/2];
    [parentView setFrame:CGRectMake(parentView.frame.origin.x, 0, parentView.frame.size.width, parentView.frame.size.height)];
    
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
    return 52;
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
//    [bg_header setBackgroundColor:[UIColor colorWithRed:246/255.0 green:137/255.0 blue:37/255.0 alpha:1]];
    
    [bg_header setFrame:CGRectMake(0, 0, self.view.frame.size.width, 52)];
    [bg_header setAlpha:0.8];
    
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

    [lbl_header setFont:[UIFont systemFontOfSize:18]];
    [lbl_header setTextColor:[UIColor colorWithRed:88.0/255.0 green:43/255.0 blue:133/225.0 alpha:1.0]];
    [lbl_header setTextAlignment:NSTextAlignmentRight];
    
    [lbl_header setFrame:CGRectMake(0, 6, self.view.frame.size.width, 40)];
    [lbl_header setTextAlignment:NSTextAlignmentCenter];
    
    [vw_tblheader addSubview:bg_header];
    
    [vw_tblheader addSubview:lbl_header];
    
    return vw_tblheader;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
   if(section == 2) return 100;
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *vw_tblfooter=[[UIView alloc]init];
    
    [vw_tblfooter setBackgroundColor:[UIColor clearColor]];
    
    return vw_tblfooter;
    
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
            
//           UIImageView *img=(UIImageView*)[[cell viewWithTag:1] viewWithTag:10];
//            [img removeFromSuperview];
            [cell setBackgroundColor:[UIColor grayColor]];
            [cell setAlpha:0.8];
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
    [cell.layer setCornerRadius:8];
        
    }
    return  cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    switch (collectionView.tag) {
        case 0:
    return CGSizeMake(316, 242);
            break;
            case 1:
                return CGSizeMake(316, 115);
            break;
        case 2:
            return CGSizeMake(316, 100);
            break;
        default:
            break;
    }
    return CGSizeMake(0, 0);
}
#pragma mark DownloadImages

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@""])
    {
        //Discover
        ExploreListVC *explv = (ExploreListVC *)segue.destinationViewController;
        
        
        
    }else if ([segue.identifier isEqualToString:@""])
    {
        //Recomended
        
    }else if ([segue.identifier isEqualToString:@""])
    {
        //Event planner
        
    }
    // Get the new view controller using [segue destinationViewController].
    
    
    // Pass the selected object to the new view controller.
}

#pragma mark - Server Communiccation

-(void)loadInformationFromServer{
    
    NSString *string = [NSString stringWithFormat:@"%@%@",ServerURL,Recomend_API];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
        if([[AFNetworkReachabilityManager sharedManager] isReachable])
        {
            AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            operation.responseSerializer = [AFJSONResponseSerializer serializer];
            [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"%@",responseObject);
                [tbl_exlpore reloadData];
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 [AppUtils showAlertMessage:[ NSString stringWithFormat:@"Error Retrieving Recommendations - %@",[error localizedDescription]] inView:self];
            
            }];
            
            [operation start];
        }
        else
        {
            //        [AppUtils showAlertMessage:@"Server not Reachable " inView:self];
            
        }        //check for isReachable here
    }];
    
}

@end
