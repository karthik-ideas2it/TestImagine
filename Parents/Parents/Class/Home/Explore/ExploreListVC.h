//
//  ExploreListVC.h
//  Parents
//
//  Created by Karthikeyan on 9/1/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreListVC : UIViewController <UICollectionViewDelegate,UICollectionViewDataSource,UISearchBarDelegate>
{
#pragma mark Public variables
    NSString *str_type;
    
    
#pragma mark IBOutlets
    IBOutlet UICollectionView *col_ExplList;
    IBOutlet UISegmentedControl *seg_Options;
    IBOutlet UISearchBar *sr_itemSearch;
    
    
}
@property (nonatomic,copy) NSString *str_type;
@end
