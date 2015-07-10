//
//  CircleView.h
//  CardAnimationWithPOP
//
//  Created by Albert Mao on 7/10/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CircleView : UIView
@property(nonatomic, copy)IBInspectable UIColor * lineColor;
-(void)setCircleStrokeEnd:(CGFloat)strokeEnd animated:(BOOL)animated;
@end
