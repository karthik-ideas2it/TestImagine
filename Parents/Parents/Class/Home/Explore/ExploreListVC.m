//
//  ExploreListVC.m
//  Parents
//
//  Created by Karthikeyan on 9/1/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ExploreListVC.h"
#import "ELDiscoverListCell.h"
#import "SpringCollectionViewFlowLayout.h"
@implementation ExploreListVC
@synthesize str_type;

#pragma mark Default Methods


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Set the custom layout for collection view
    SpringCollectionViewFlowLayout *SpringLayout=[[SpringCollectionViewFlowLayout alloc]init];
    SpringLayout.itemSize= CGSizeMake(self.view.frame.size.width, 100);
    col_ExplList.collectionViewLayout = SpringLayout;
}

-(void)viewWillLayoutSubviews{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(IBAction)Back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark Collection View - list Elements
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    // Register the Nib for collection view cell
    UINib *nib = [UINib nibWithNibName:@"ELDiscoverListCell" bundle: nil];
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"DiscoverCell"];

    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 25;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    ELDiscoverListCell *cell = (ELDiscoverListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"DiscoverCell" forIndexPath:indexPath];
    if(cell==nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ELDiscoverListCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
//    NSDictionary *dict= @[@"title":@"",@"name":@"",@"date":@"",@"":@""];
    [cell SetValuesForItems:nil];

    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.view.frame.size.width, 100);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0.5;
}
#pragma mark Segment control delegates

-(IBAction)optionsChanged:(id)sender
{
    
}

@end
