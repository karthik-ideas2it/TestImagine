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
    [(UILabel *) [self viewWithTag:2] setText:@"Keep an eye out for developmental milestones for your little one"];
    [(UILabel *) [self viewWithTag:3] setText:@"Sam Adams"];
    [(UILabel *) [self viewWithTag:4] setText:@"15 Aug, 2015"];
}

@end
