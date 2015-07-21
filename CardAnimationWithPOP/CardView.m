//
//  CardView.m
//  CardAnimationWithPOP
//
//  Created by Albert Mao on 7/10/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "CardView.h"

#import "CircleView.h"
#import <QuartzCore/QuartzCore.h>
@interface CardView()
@property (nonatomic, strong) CircleView *circleView1;
@property (nonatomic, strong) CircleView *circleView2;

@end

@implementation CardView
-(void)awakeFromNib{
    self.circleView1 = [[CircleView alloc]initWithFrame:CGRectMake(15, 15, self.circleSize.width, self.circleSize.height)];
    self.circleView2 = [[CircleView alloc]initWithFrame:CGRectMake(15, 15, self.circleSize.width, self.circleSize.height)];
}

-(void)prepareForInterfaceBuilder
{
    [self config];
}

- (void) config
{
    CAShapeLayer *maskLayer= [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.layer.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(self.cornerRadius, self.cornerRadius)].CGPath;
    self.layer.mask = maskLayer;
    [self setBackgroundColor:self.bgColor];
    self.circleView1 = [[CircleView alloc]initWithFrame:CGRectMake(15, 15, self.circleSize.width, self.circleSize.height)];
    self.circleView2 = [[CircleView alloc]initWithFrame:CGRectMake(15, 15, self.circleSize.width, self.circleSize.height)];
    self.circleView1.lineColor = self.tapColor1;
    self.circleView2.lineColor = self.tapColor2;
    self.circleView2.center = self.center;
    [self addSubview:self.circleView1];
    [self addSubview:self.circleView2];
    
    [self.circleView1 setCircleStrokeEnd:0.0f animated:YES];
    [self.circleView2 setCircleStrokeEnd:1.0f animated:YES];

}


@end
