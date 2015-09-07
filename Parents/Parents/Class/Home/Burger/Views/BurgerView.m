//
//  BurgerView.m
//  Parents
//
//  Created by ideas2it on 8/27/15.
//  Copyright (c) 2015 ideas2it. All rights reserved.
//

#import "BurgerView.h"

#define DEGREES_TO_RADIANS(angle)   (angle * M_PI/180)
#define RADIANS_TO_DEGREES(radians) (radians * 180/M_PI)
#define OPTIONS_VIEW_HEIGHT          250
#define INCREMENTAL_ANGLE            50
#define FAMILY_MEMBERS_START_ANGLE   180
#define OPTIONS_VIEW_OFFSET          5
#define FAMILY_MEMBERS_VIEW_VALUE    50
#define OFFSET_VALUE_FOR_OPTIONS_BUTTONS_TAG 100
#define ANIMATION_DURATION           .4

static CGFloat const kDashedLinesLength[]   = {2.0f, 4.0f};

@interface BurgerView ()
{
    CGPoint convertedCenter,viewCenter, centerPointForMaskLayerPath;
    NSInteger familyCount,radius,noOfOptions;
    UIView *optionsViewPerPerson,*maskOptionsViewForCornerRadius;
    CGRect circleRect;
    BOOL isOptionsViewShown;
    double optionsViewStartAngle, optionsViewEndAngle,angleBetweenStartAndEndPoints;
    UIImageView *burgerCenterImage;
}

- (void)moveButtonsWithRespectToButton:(UIButton*)targetButton isReset:(BOOL)resetFlag;
- (void)showOptionsViewAnimatedForButton:(UIButton*)button;
- (void)hideOptionsViewAnimatedForButton:(UIButton*)button completionHAndler:(animationCompletionBlock)completionblock;

@property (nonatomic, strong) NSMutableArray *initialViewAngles;
@property (nonatomic, strong) UIButton       *currentSelectedButton, *lastOptionButton;;

@end

@implementation BurgerView

-(void)setupViewsWithFamilyCount:(NSInteger)count
{
    circleRect = CGRectIntegral(CGRectInset(self.bounds, (FAMILY_MEMBERS_VIEW_VALUE/2) + OPTIONS_VIEW_OFFSET, (FAMILY_MEMBERS_VIEW_VALUE/2) + OPTIONS_VIEW_OFFSET));
    familyCount = count;
    self.initialViewAngles = [NSMutableArray array];
    noOfOptions = 3;
    
    burgerCenterImage = [[UIImageView alloc] initWithFrame:CGRectIntegral(CGRectInset(circleRect, FAMILY_MEMBERS_VIEW_VALUE, FAMILY_MEMBERS_VIEW_VALUE))];
    [burgerCenterImage setBackgroundColor:[UIColor whiteColor]];
    [burgerCenterImage setImage:[UIImage imageNamed:@"burger_center_image"]];
    [burgerCenterImage setContentMode:UIViewContentModeCenter];
    [self addSubview:burgerCenterImage];
    
    float curAngle = DEGREES_TO_RADIANS(FAMILY_MEMBERS_START_ANGLE); // here the angle is clockwise
    float incAngle = DEGREES_TO_RADIANS(INCREMENTAL_ANGLE);
    for (NSInteger counter = 1; counter <= familyCount; counter++) {
        UIButton *objButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, FAMILY_MEMBERS_VIEW_VALUE, FAMILY_MEMBERS_VIEW_VALUE)];
        [objButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        objButton.tag = counter;
        [objButton setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"family_%ld",(long)counter]] forState:UIControlStateNormal];
       // [objButton setBackgroundColor:[UIColor greenColor]];
        objButton.layer.masksToBounds = YES;
        objButton.layer.cornerRadius = CGRectGetWidth(objButton.bounds)/2;
        [self addSubview:objButton];
        [self.initialViewAngles addObject:[NSNumber numberWithFloat:curAngle]];
        curAngle +=incAngle;
    }
    
    optionsViewPerPerson = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:optionsViewPerPerson];
    maskOptionsViewForCornerRadius = [[UIView alloc] initWithFrame:optionsViewPerPerson.bounds];
    [optionsViewPerPerson addSubview:maskOptionsViewForCornerRadius];
    [maskOptionsViewForCornerRadius.layer setBorderWidth:FAMILY_MEMBERS_VIEW_VALUE + 2*OPTIONS_VIEW_OFFSET];
    [maskOptionsViewForCornerRadius.layer setBorderColor:[UIColor whiteColor].CGColor];
    [self sendSubviewToBack:optionsViewPerPerson];
    for (NSInteger counter = 1; counter <= 3; counter++) {
        UIButton *optionsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, FAMILY_MEMBERS_VIEW_VALUE, FAMILY_MEMBERS_VIEW_VALUE)];
        [optionsButton addTarget:self action:@selector(optionsTapped:) forControlEvents:UIControlEventTouchUpInside];
        optionsButton.tag = OFFSET_VALUE_FOR_OPTIONS_BUTTONS_TAG + counter;
        [optionsButton setBackgroundColor:[UIColor blueColor]];
        optionsButton.layer.masksToBounds = YES;
        optionsButton.layer.borderWidth = 0.0;
        optionsButton.layer.cornerRadius = CGRectGetWidth(optionsButton.bounds)/2;
        [optionsViewPerPerson addSubview:optionsButton];
    }
    [optionsViewPerPerson setHidden:YES];


}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextSetLineDash(context, 0, kDashedLinesLength, 2) ;
    CGContextAddEllipseInRect(context, circleRect); // the inset is to acomodate the line width at the points where the circle actually touches the frame
    CGContextStrokePath(context);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    circleRect = CGRectIntegral(CGRectInset(self.bounds, (FAMILY_MEMBERS_VIEW_VALUE/2) + OPTIONS_VIEW_OFFSET, (FAMILY_MEMBERS_VIEW_VALUE/2) + OPTIONS_VIEW_OFFSET));
    convertedCenter = [self convertPoint:self.center fromView:self.superview];
    radius = CGRectGetWidth(circleRect)/2;
    [burgerCenterImage setFrame:CGRectIntegral(CGRectInset(circleRect, FAMILY_MEMBERS_VIEW_VALUE, FAMILY_MEMBERS_VIEW_VALUE))];
    [burgerCenterImage.layer setCornerRadius:CGRectGetWidth(burgerCenterImage.bounds)/2];
    [maskOptionsViewForCornerRadius.layer setCornerRadius:CGRectGetWidth(optionsViewPerPerson.bounds)/2];
    NSLog(@"%@",NSStringFromCGPoint(convertedCenter));
    float curAngle = DEGREES_TO_RADIANS(FAMILY_MEMBERS_START_ANGLE); // here the angle is clockwise
    float incAngle = DEGREES_TO_RADIANS(INCREMENTAL_ANGLE);//( 360.0/(familyCount) )*M_PI/180.0;
    for (UIView *objButton in [self subviews]) {
        if([objButton isKindOfClass:[UIButton class]])
        {
        viewCenter.x = convertedCenter.x + cos(curAngle)*radius;
        viewCenter.y = convertedCenter.y + sin(curAngle)*radius;
        objButton.center = viewCenter;
        curAngle +=incAngle;
        }
    }
    [optionsViewPerPerson setFrame:self.bounds];
    [maskOptionsViewForCornerRadius setFrame:optionsViewPerPerson.bounds];

}

-(void)buttonTapped:(UIButton*)button
{
  if(!isOptionsViewShown)
  {
    [self showOptionsViewAnimatedForButton:button];
    [self moveButtonsWithRespectToButton:button isReset:NO];
    
  }
  else
  {
      if (self.currentSelectedButton == button)  // just hide the options menu
      {
          [self hideOptionsViewAnimatedForButton:button completionHAndler:nil];
          [self moveButtonsWithRespectToButton:button isReset:YES];
      }
      else
      {
          [self moveButtonsWithRespectToButton:self.currentSelectedButton isReset:YES];
          [self hideOptionsViewAnimatedForButton:self.currentSelectedButton completionHAndler:^{
              [self showOptionsViewAnimatedForButton:button];
              [self moveButtonsWithRespectToButton:button isReset:NO];
              
          }];
      }


  }
  self.currentSelectedButton = button;
 
}

-(void)optionsTapped:(UIButton*)optionsButton
{
    
}

-(void)moveButtonsWithRespectToButton:(UIButton *)targetButton isReset:(BOOL)resetFlag
{
    CAKeyframeAnimation *pathAnimation;
   // double angleBetweenStartAndEndPoints = OPTIONS_VIEW_HEIGHT/radius;
    double angleForCurrentCenterPoint,angleForEndPoint;

    for (NSInteger tag = 1; tag < targetButton.tag; tag++) {
        UIButton *objButton = (UIButton*)[self viewWithTag:tag];
        NSLog(@"%@ \n center %@",NSStringFromCGPoint(objButton.layer.position),NSStringFromCGPoint(objButton.center));
        NSLog(@"%@",NSStringFromCGRect(objButton.frame));
        pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        pathAnimation.removedOnCompletion = YES;
        NSLog(@"%f",RADIANS_TO_DEGREES(M_PI));
        NSLog(@"%f",RADIANS_TO_DEGREES(angleBetweenStartAndEndPoints));
        if(resetFlag)
        {
            angleForEndPoint = [self.initialViewAngles[tag-1] floatValue];
            angleForCurrentCenterPoint = angleForEndPoint - angleBetweenStartAndEndPoints;
        }
        else
        {
            angleForCurrentCenterPoint = [self.initialViewAngles[tag-1] floatValue];//acos((objButton.center.x - convertedCenter.x)/radius);
            NSLog(@"%f",RADIANS_TO_DEGREES(angleForCurrentCenterPoint));
            angleForEndPoint = angleForCurrentCenterPoint - angleBetweenStartAndEndPoints;
            NSLog(@"%f",RADIANS_TO_DEGREES(angleForEndPoint));
        }
        UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:convertedCenter
                                                             radius:radius
                                                         startAngle:angleForCurrentCenterPoint
                                                           endAngle:angleForEndPoint
                                                          clockwise:resetFlag];
        pathAnimation.path = aPath.CGPath;
        [pathAnimation setCalculationMode:kCAAnimationPaced];
        [pathAnimation setFillMode:kCAFillModeForwards];
        pathAnimation.duration = ANIMATION_DURATION;
        [objButton.layer addAnimation:pathAnimation forKey:@"rotateForOptionsView"];
        objButton.center = CGPointMake(convertedCenter.x + radius*cos(angleForEndPoint), convertedCenter.y + radius*sin(angleForEndPoint));
    }
}

-(void)showOptionsViewAnimatedForButton:(UIButton *)button
{
    isOptionsViewShown = YES;
    animationCompletionBlock theBlock;
    double angleForCurrentCenterPoint, buttonOffsetValue;
    
    buttonOffsetValue = (FAMILY_MEMBERS_VIEW_VALUE * sqrtf(2))/(2 * radius); // this is to start from the button origin instead of centre. it is length of arc = theta* radius. theta = (diagonal/2)/radius.
    
    float curAngle = [self.initialViewAngles[button.tag-1] floatValue]; // here the angle is clockwise
    float incAngle = 2*buttonOffsetValue + (OPTIONS_VIEW_OFFSET/radius);
    curAngle -= incAngle;
    for (UIView *objButton in [optionsViewPerPerson subviews]) {
        if([objButton isKindOfClass:[UIButton class]])
        {
            if((objButton.tag % 100) <= noOfOptions)
            {
            [objButton setHidden:NO];
            viewCenter.x = convertedCenter.x + cos(curAngle)*radius;
            viewCenter.y = convertedCenter.y + sin(curAngle)*radius;
            objButton.center = viewCenter;
            curAngle -=incAngle;
                self.lastOptionButton = (UIButton*)objButton;
            }
            else
            {
                [objButton setHidden:YES];
            }
        }
    }
    [optionsViewPerPerson setHidden:NO];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    CGFloat maskHeight = optionsViewPerPerson.layer.bounds.size.height;
    CGFloat maskWidth = optionsViewPerPerson.layer.bounds.size.width;
    // CGPoint centerPointForMaskLayerPath;
    centerPointForMaskLayerPath = CGPointMake(maskWidth/2, maskHeight/2);
    //Make the radius of our arc large enough to reach into the corners of the image view.
    CGFloat radiusForOptionsView = sqrtf(maskWidth * maskWidth + maskHeight * maskHeight)/2;
    //  CGFloat radius = MIN(maskWidth, maskHeight)/2;
    
    //Don't fill the path, but stroke it in black.
    maskLayer.fillColor = [[UIColor clearColor] CGColor];
    // maskLayer.fillRule = kCAFillRuleEvenOdd;
    maskLayer.strokeColor = [[UIColor blackColor] CGColor];
    maskLayer.lineWidth = radiusForOptionsView; //Make the line thick enough to completely fill the circle we're drawing
    //  maskLayer.lineWidth = 10; //Make the line thick enough to completely fill the circle we're drawing
    CGMutablePathRef arcPath = CGPathCreateMutable();
    angleForCurrentCenterPoint = [self.initialViewAngles[button.tag-1] floatValue];
    // angleForCurrentCenterPoint += buttonOffsetValue;
    angleForCurrentCenterPoint += DEGREES_TO_RADIANS(1); // this 1 offset is to make a seamless transition between the rounded corners layer and the actual layer
    
    optionsViewStartAngle = angleForCurrentCenterPoint;
    optionsViewEndAngle = curAngle + incAngle - DEGREES_TO_RADIANS(1);
    angleBetweenStartAndEndPoints = optionsViewStartAngle - optionsViewEndAngle;
    //Create an arc at 1/2 our circle radius, with a line thickess of the full circle radius
    CGPathAddArc(arcPath,
                 nil,
                 centerPointForMaskLayerPath.x,
                 centerPointForMaskLayerPath.y,
                 radius/2,
                 angleForCurrentCenterPoint,
                 optionsViewEndAngle,
                 YES);
    
    
    
    maskLayer.path = arcPath;
    
    //Start with an empty mask path (draw 0% of the arc)
    maskLayer.strokeEnd = 0.0;
    
    
    CFRelease(arcPath);
    
    CAShapeLayer *maskForMaskLayer = [CAShapeLayer layer];
    maskForMaskLayer.lineWidth = radiusForOptionsView;
    CGMutablePathRef maskArcPath = CGPathCreateMutable();
    CGAffineTransform transform = CGAffineTransformMakeTranslation(button.center.x, button.center.y);
    transform = CGAffineTransformRotate(transform, angleForCurrentCenterPoint - DEGREES_TO_RADIANS(180)); // this 180 is to convert the angle from optionsviewcenter to button center
    transform = CGAffineTransformTranslate(transform, -button.center.x, -button.center.y);
    CGPathAddArc(maskArcPath,
                 &transform,
                 button.center.x,
                 button.center.y,
                 button.layer.cornerRadius + OPTIONS_VIEW_OFFSET,
                 DEGREES_TO_RADIANS(0),
                 DEGREES_TO_RADIANS(180),
                 YES);
    
    maskForMaskLayer.path = maskArcPath;
    
    //Start with an empty mask path (draw 0% of the arc)
    maskForMaskLayer.strokeEnd = 0.0;
    
    
    CFRelease(maskArcPath);
    [maskLayer addSublayer:maskForMaskLayer];
    maskForMaskLayer.frame = maskLayer.bounds;
    
    
    //Install the mask layer into out image view's layer.
    optionsViewPerPerson.layer.mask = maskLayer;
    
    //Set our mask layer's frame to the parent layer's bounds.
    optionsViewPerPerson.layer.mask.frame = optionsViewPerPerson.layer.bounds;
    
    //Create an animation that increases the stroke length to 1, then reverses it back to zero.
    CABasicAnimation *swipe = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    swipe.duration = ANIMATION_DURATION;
    swipe.delegate = self;
    theBlock = ^void(void)
    {
        CAShapeLayer *bottomMaskForMaskLayer = [CAShapeLayer layer];
        bottomMaskForMaskLayer.lineWidth = radiusForOptionsView;
        CGMutablePathRef bottomMaskArcPath = CGPathCreateMutable();
        CGAffineTransform transform = CGAffineTransformMakeTranslation(self.lastOptionButton.center.x, self.lastOptionButton.center.y);
        transform = CGAffineTransformRotate(transform, curAngle + incAngle);
        transform = CGAffineTransformTranslate(transform, -self.lastOptionButton.center.x, -self.lastOptionButton.center.y);
        CGPathAddArc(bottomMaskArcPath,
                     &transform,
                     self.lastOptionButton.center.x,
                     self.lastOptionButton.center.y,
                     self.lastOptionButton.layer.cornerRadius + OPTIONS_VIEW_OFFSET,
                     DEGREES_TO_RADIANS(0),
                     DEGREES_TO_RADIANS(180),
                     YES);
        
        bottomMaskForMaskLayer.path = bottomMaskArcPath;
        
        //Start with an empty mask path (draw 0% of the arc)
        bottomMaskForMaskLayer.strokeEnd = 0.0;
        
        
        CFRelease(bottomMaskArcPath);
        bottomMaskForMaskLayer.frame = maskLayer.bounds;
        [maskLayer addSublayer:bottomMaskForMaskLayer];

    };
    
    [swipe setValue: theBlock forKey: kAnimationCompletionBlock];
    swipe.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    swipe.fillMode = kCAFillModeForwards;
    swipe.removedOnCompletion = NO;
    swipe.toValue = [NSNumber numberWithFloat: 1.0];
    [maskLayer addAnimation:swipe forKey: @"strokeEnd"];

}

-(void)hideOptionsViewAnimatedForButton:(UIButton *)button completionHAndler:(animationCompletionBlock)completionblock
{
    isOptionsViewShown = NO;
    CAShapeLayer *maskedLayer = (CAShapeLayer*)[optionsViewPerPerson.layer mask];
    
    CGMutablePathRef hideOptionsPath = CGPathCreateMutable();
    CGPathAddArc(hideOptionsPath, nil, centerPointForMaskLayerPath.x, centerPointForMaskLayerPath.y, radius/2, optionsViewEndAngle, optionsViewStartAngle, NO);
    maskedLayer.path = hideOptionsPath;
    CFRelease(hideOptionsPath);
    
    [[[maskedLayer sublayers] objectAtIndex:1] removeFromSuperlayer]; // here it is known there are only two layers to the masked layer. hence removing the second one which is added last so that animation reverses
    CABasicAnimation *hideOptionsAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    hideOptionsAnimation.duration = ANIMATION_DURATION;
    hideOptionsAnimation.delegate = self;
    animationCompletionBlock theBlock;
    if(completionblock)
    {
        theBlock = completionblock;
    }
    else
    {
    theBlock = ^void(void)
    {
        [[[maskedLayer sublayers] objectAtIndex:0] removeFromSuperlayer]; // here it is known there are only two layers to the masked layer. hence removing the first one which is added first because of reverse animation
        [optionsViewPerPerson.layer setMask:nil];
        [optionsViewPerPerson setHidden:YES];
        
    };
    }
    [hideOptionsAnimation setValue:theBlock forKey:kAnimationCompletionBlock];
    hideOptionsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    hideOptionsAnimation.fillMode = kCAFillModeForwards;
    hideOptionsAnimation.removedOnCompletion = NO;
    hideOptionsAnimation.toValue = [NSNumber numberWithFloat: 1.0];
    [maskedLayer addAnimation:hideOptionsAnimation forKey: @"strokeStart"];

}

#pragma mark CAAnimation Delegate methods

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    animationCompletionBlock theBlock = [anim valueForKey: kAnimationCompletionBlock];
    if (theBlock)
        theBlock();
}

@end
