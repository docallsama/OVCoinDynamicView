//
//  OVCoinDynamicView.m
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import "OVCoinDynamicView.h"
#import "OVCoinCellView.h"
#import <CoreMotion/CoreMotion.h>

@interface OVCoinDynamicView () {
    UIDynamicAnimator *animator;
    UIGravityBehavior *gravity;
    UIDynamicItemBehavior *dynamicBehavior;
    UICollisionBehavior *collision;
    
    CMMotionManager *motionManager;
    NSOperationQueue *motionQueue;
}

@end

@implementation OVCoinDynamicView

- (void)configureWithNewCoin {
    self.coinsArray = [[NSMutableArray alloc] init];
    
    animator = [[UIDynamicAnimator alloc] initWithReferenceView:self];
    
    gravity = [[UIGravityBehavior alloc] initWithItems:@[]];
    [animator addBehavior:gravity];
    
    dynamicBehavior = [[UIDynamicItemBehavior alloc] initWithItems:@[]];
    dynamicBehavior.elasticity = 0.7;
    [animator addBehavior:dynamicBehavior];
    
    collision = [[UICollisionBehavior alloc] initWithItems:@[]];
    collision.translatesReferenceBoundsIntoBoundary = YES;
    [animator addBehavior:collision];
    
    [self configureCMMotionManager];
}

- (void)configureCMMotionManager {
    motionManager = [[CMMotionManager alloc] init];
    motionQueue = [[NSOperationQueue alloc] init];
    
    [motionManager startDeviceMotionUpdatesToQueue:motionQueue withHandler:^(CMDeviceMotion * _Nullable motion, NSError * _Nullable error) {
        
        float aTangle = atan2f(motion.gravity.x,motion.gravity.y);
        float tempTangle = aTangle + M_PI_2 * 3;
        float finalTangle = (tempTangle > M_PI * 2 ? tempTangle - M_PI * 2 : tempTangle);
        NSLog(@"final tangle -> %f",finalTangle);
        
        gravity.angle = finalTangle;
    }];
}

- (void)addCoinWithRadius:(float)radius andImageURL:(NSString *)imageURL {
    OVCoinCellView *coinCellView = [OVCoinCellView createCoinViewWithRadius:radius andImageURL:imageURL];
    coinCellView.center = CGPointMake(arc4random() % (int)self.frame.size.width, 0);
    [self addSubview:coinCellView];
    [self addCoinToGravityView:coinCellView];
}

- (void)addCoinWithRadius:(float)radius andImageName:(NSString *)imageName {
    OVCoinCellView *coinCellView = [OVCoinCellView createCoinViewWithRadius:radius andImageName:imageName];
    coinCellView.center = CGPointMake(arc4random() % (int)self.frame.size.width, 0);
    [self addSubview:coinCellView];
    [self addCoinToGravityView:coinCellView];
}

- (void)addCoinToGravityView:(OVCoinCellView *)coinCellView {
    [self.coinsArray addObject:coinCellView];
    [dynamicBehavior addItem:coinCellView];
    [gravity addItem:coinCellView];
    [collision addItem:coinCellView];
}

- (void)stopDeviceMotionEffect {
    [motionManager stopDeviceMotionUpdates];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [self stopDeviceMotionEffect];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
