//
//  OVCoinDynamicView.h
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OVCoinDynamicView : UIView

@property (nonatomic, retain)NSMutableArray *coinsArray;

//配置硬币效果
- (void)configureWithNewCoin;

//加入使用远程图片的硬币
- (void)addCoinWithRadius:(float)radius andImageURL:(NSString *)imageURL;

//加入使用本地图片的硬币
- (void)addCoinWithRadius:(float)radius andImageName:(NSString *)imageName;

//停止重力感应
- (void)stopDeviceMotionEffect;

@end
