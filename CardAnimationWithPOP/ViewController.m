//
//  ViewController.m
//  CardAnimationWithPOP
//
//  Created by Albert Mao on 7/10/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "ViewController.h"

#import "CardView.h"
#import <POP.h>

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic) NSUInteger currentIndex;
@property (nonatomic) NSUInteger initialLocation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.currentIndex = 0;
    self.cards = [NSMutableArray array];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showCardZone
{
    for (int i = 0; i<4; i++) {
        CardView *card = [[[NSBundle mainBundle] loadNibNamed:@"CardView" owner:self options:nil] firstObject];
        card.frame = CGRectMake(0, 0, 300, 400);
        [card config];
    }
}

- (void) setCenter:(CGPoint) center duration:(CGFloat) duration card:(CardView *) card index:(NSUInteger) index{
    POPBasicAnimation *basAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
    basAni.toValue = [NSValue valueWithCGPoint:center];
    basAni.duration = duration;
    [basAni setCompletionBlock:^(POPAnimation *animation, BOOL isFinish) {
        if (isFinish) {
            card.hidden = YES;
        }
    }];
    [card pop_addAnimation:basAni forKey:@"center"];
}




@end
