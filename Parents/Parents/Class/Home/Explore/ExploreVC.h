//
//  ExploreVC.h
//  Parents
//
//  Created by Karthikeyan on 8/27/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExploreVC : UIViewController <UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate>
{
    IBOutlet UIView *vw_header;
    IBOutlet UIScrollView *scr_header;
    IBOutlet UITableView *tbl_exlpore;
    
}
@end
