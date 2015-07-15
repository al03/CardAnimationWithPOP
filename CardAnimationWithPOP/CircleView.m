//
//  CircleView.m
//  CardAnimationWithPOP
//
//  Created by Albert Mao on 7/10/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "CircleView.h"

#import <POP.h>
#import <QuartzCore/QuartzCore.h>
@interface CircleView()
@property (nonatomic, strong) CAShapeLayer *circleLayer;
@property (nonatomic, strong) UILabel *label;
@end


@implementation CircleView

-(void)awakeFromNib
{
    [self configCircle];
    [self configLabel];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self configCircle];
        [self configLabel];
    }
    return self;
}

- (void) configLabel{
    self.label = [[UILabel alloc]init];
    self.label.text = @"0%";
    self.label.frame = CGRectMake(0, 0, 100, 100);
    self.label.textColor = [UIColor whiteColor];
    self.label.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    self.label.font = [UIFont systemFontOfSize:25];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

- (void) configCircle
{
    self.circleLayer = [CAShapeLayer layer];
    CGFloat lineWidth = 4.0f;
    CGFloat radius = self.bounds.size.width/2 - lineWidth;
    CGRect rect = CGRectMake(lineWidth/2, lineWidth/2, radius*2, radius*2);
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius];
    
    self.circleLayer.strokeColor = self.lineColor.CGColor;
    self.circleLayer.path = bezier.CGPath;
    self.circleLayer.fillColor = nil;
    self.circleLayer.lineJoin = kCALineJoinRound;
    self.circleLayer.lineCap = kCALineJoinRound;
    self.circleLayer.lineWidth = lineWidth;
    
    CAShapeLayer * bgCircle = [CAShapeLayer layer];
    bgCircle.lineWidth = 1.0f;
    bgCircle.strokeStart = 0.0f;
    bgCircle.strokeEnd = 1.0f;
    bgCircle.strokeColor = [UIColor grayColor].CGColor;
    bgCircle.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(lineWidth-1, lineWidth-1, radius*2, radius*2) cornerRadius:radius-lineWidth+1].CGPath;
    bgCircle.lineCap = kCALineCapRound;
    bgCircle.lineJoin = kCALineJoinRound;
    bgCircle.fillColor = nil;
    [self.layer addSublayer:bgCircle];
    [self.layer addSublayer:self.circleLayer];
    
}

- (void) setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    self.circleLayer.strokeColor = self.lineColor.CGColor;
}

- (void) animationWithStrokeEnd:(CGFloat)strokeEnd
{
    POPBasicAnimation *bAni = [POPBasicAnimation animationWithPropertyNamed:kPOPShapeLayerStrokeEnd];
    bAni.toValue = @(strokeEnd);
    bAni.duration = 1;
    bAni.removedOnCompletion = NO;
    [self.circleLayer pop_addAnimation:bAni forKey:@"123"];

    POPBasicAnimation *labelAni = [POPBasicAnimation animation];
    labelAni.duration = 1;
    POPAnimatableProperty *prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
       [prop setReadBlock:^(id obj, CGFloat values[]) {
           values[0] = [[obj description] floatValue];
           
       }];
        
        [prop setWriteBlock:^(id obj, const CGFloat valus[]) {
            NSString *str = [NSString stringWithFormat:@"%.2f", valus[0]];
            [obj setText:[NSString stringWithFormat:@"%@%%",str]];
        }];
        
        prop.threshold = 0.01;
    }];
    
    labelAni.property = prop;
    labelAni.fromValue = @(0.0);
    labelAni.toValue = @(100.0f * strokeEnd);
    [self.layer pop_addAnimation:labelAni forKey:@"123"];
    
}

- (void) setCircleStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated
{
    if (animated) {
        [self animationWithStrokeEnd:strokeEnd];
    }else{
        self.circleLayer.strokeEnd = strokeEnd;
    }
}

@end
