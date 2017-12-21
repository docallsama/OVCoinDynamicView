//
//  OVCoinDynamicView.m
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import "OVCoinDynamicView.h"
#import "OVCoinCellView.h"

@interface OVCoinDynamicView () {
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravity;
    UICollisionBehavior *collision;
}

@end

@implementation OVCoinDynamicView

- (void)configureWithNewCoin {
    
    self.coinsArray = [[NSMutableArray alloc] init];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    gravity = [[UIGravityBehavior alloc] initWithItems:@[]];
    [animator addBehavior:gravity];
    
    collision = [[UICollisionBehavior alloc] initWithItems:@[]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    [animator addBehavior:collision];
}

- (void)addCoin {
    OVCoinCellView *coinCellView = [OVCoinCellView createCoinViewWithRadius:20];
    coinCellView.center = CGPointMake(arc4random() % 200, 0);
    [self addSubview:coinCellView];
    
    [self.coinsArray addObject:coinCellView];
    [gravity addItem:coinCellView];
    [collision addItem:coinCellView];
    
//    gravity.angle = -M_PI_4;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
