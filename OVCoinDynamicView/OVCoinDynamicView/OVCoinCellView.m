//
//  OVCoinCellView.m
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import "OVCoinCellView.h"

@interface OVCoinCellView () <UIDynamicItem> {
    
}

@end

@implementation OVCoinCellView

+ (OVCoinCellView *)createCoinViewWithRadius:(float)radius {
    OVCoinCellView *coinView = [[OVCoinCellView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius *2)];
    [coinView configureWithContent];
    return coinView;
}

- (void)configureWithContent {
    UILabel *coin = [[UILabel alloc] initWithFrame:self.bounds];
    coin.text = @"⤴️";
    coin.textAlignment = NSTextAlignmentCenter;
    coin.backgroundColor = [UIColor greenColor];
    [self addSubview:coin];
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}

//- (UIBezierPath *)collisionBoundingPath {
//    return [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 40, 40)];
//}
//
//- (UIDynamicItemCollisionBoundsType)collisionBoundsType
//{
//    return UIDynamicItemCollisionBoundsTypePath;
//}

- (UIDynamicItemCollisionBoundsType)collisionBoundsType
{
    return UIDynamicItemCollisionBoundsTypeEllipse;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
