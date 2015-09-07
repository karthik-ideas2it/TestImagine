//
//  ELDiscoverListCell.m
//  Parents
//
//  Created by Karthikeyan on 9/1/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ELDiscoverListCell.h"

@implementation ELDiscoverListCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)SetValuesForItems:(id)Dict
{
    [[(UIImageView *) self viewWithTag:1].layer setCornerRadius:4];
//    [[(UIImageView *) [self viewWithTag:1] setImage:[UIImage imageNamed:@""]];
    [(UILabel *) [self viewWithTag:2] setText:[NSString stringWithFormat:@"%@",[Dict valueForKey:@"title"]]];
    [(UILabel *) [self viewWithTag:3] setText:[NSString stringWithFormat:@"%@",[Dict valueForKey:@"name"]]];
    [(UILabel *) [self viewWithTag:4] setText:[NSString stringWithFormat:@"%@",[Dict valueForKey:@"date"]]];
}

@end
