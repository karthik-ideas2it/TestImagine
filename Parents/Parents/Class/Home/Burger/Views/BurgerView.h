//
//  BurgerView.h
//  Parents
//
//  Created by ideas2it on 8/27/15.
//  Copyright (c) 2015 ideas2it. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^animationCompletionBlock)(void);
#define kAnimationCompletionBlock @"animationCompletionBlock"

@interface BurgerView : UIView

@property (nonatomic, strong) NSArray *imagesArray;

-(void)setupViewsWithFamilyCount:(NSInteger)count;

@end
