//
//  BurgerVC.h
//  Parents
//
//  Created by ideas2it on 9/3/15.
//  Copyright (c) 2015 Karthikeyan. All rights reserved.
//

#import "ViewController.h"
#import "BurgerView.h"

@interface BurgerVC : ViewController
@property (weak, nonatomic) IBOutlet BurgerView *objBurgerView;
@property (weak, nonatomic) IBOutlet UIButton *btnFAQ;
@property (weak, nonatomic) IBOutlet UIButton *btnContactUs;
- (IBAction)btnFAQTapped:(id)sender;
- (IBAction)btnContactUsTapped:(id)sender;
- (IBAction)btnCloseTapped:(id)sender;
- (IBAction)btnLikeTapped:(id)sender;
- (IBAction)btnCalendarTapped:(id)sender;
- (IBAction)btnNotificationTapped:(id)sender;

@end
