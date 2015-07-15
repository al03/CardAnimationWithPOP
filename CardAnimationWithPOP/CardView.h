//
//  CardView.h
//  CardAnimationWithPOP
//
//  Created by Albert Mao on 7/10/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface CardView : UIView
@property (nonatomic, copy) IB_DESIGNABLE UIColor *bgColor;
@property(nonatomic)IBInspectable CGFloat cornerRadius;
@property(nonatomic)IBInspectable CGFloat buttonConnerRadius;
@property(nonatomic)IBInspectable UIColor * tapColor1;
@property(nonatomic)IBInspectable UIColor * tapColor2;
@property(nonatomic)IBInspectable CGSize circleSize;
@property(nonatomic)IBInspectable CGSize shadowSize;
@end
