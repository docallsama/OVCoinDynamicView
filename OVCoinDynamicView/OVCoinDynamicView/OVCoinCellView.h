//
//  OVCoinCellView.h
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OVCoinCellView : UIView

//创建coinview，可设置圆半径以及远程图片
+ (OVCoinCellView *)createCoinViewWithRadius:(float)radius andImageURL:(NSString *)imageURL;

//创建coinview，可设置圆半径以及本地图片
+ (OVCoinCellView *)createCoinViewWithRadius:(float)radius andImageName:(NSString *)imageName;

@end
