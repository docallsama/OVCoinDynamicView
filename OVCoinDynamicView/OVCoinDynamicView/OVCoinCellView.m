//
//  OVCoinCellView.m
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import "OVCoinCellView.h"
#import <UIImageView+WebCache.h>

@interface OVCoinCellView () <UIDynamicItem> {
    
}

@end

@implementation OVCoinCellView

+ (OVCoinCellView *)createCoinViewWithRadius:(float)radius andImageURL:(NSString *)imageURL {
    OVCoinCellView *coinView = [[OVCoinCellView alloc] initWithFrame:CGRectMake(0, 0, radius * 2, radius *2)];
    [coinView configureWithContentImageURL:imageURL];
    return coinView;
}

- (void)configureWithContentImageURL:(NSString *)imageURL {
    UIImageView *coinImageView = [[UIImageView alloc] initWithFrame:self.bounds];
    [coinImageView sd_setImageWithURL:[NSURL URLWithString:imageURL]];
    [self addSubview:coinImageView];
    
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
