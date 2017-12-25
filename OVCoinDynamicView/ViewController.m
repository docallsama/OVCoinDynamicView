//
//  ViewController.m
//  OVCoinDynamicView
//
//  Created by 谢艺欣 on 2017/12/21.
//  Copyright © 2017年 谢艺欣. All rights reserved.
//

#import "ViewController.h"
#import "OVCoinDynamicView.h"

@interface ViewController () {
    OVCoinDynamicView *dynamicView;
    NSArray *imagesArray;
    NSArray *localImagesArray;
    
    int imageIndex;
    int localImageIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createImagesArray];
    
    [self addButtonToView];
    [self addOVCoinDynamicView];
}

- (void)createImagesArray {
    imagesArray = @[@"https://avatars1.githubusercontent.com/u/34479859?s=100&v=4",
                    @"https://avatars3.githubusercontent.com/u/2994594?s=100&v=4",
                    @"https://avatars2.githubusercontent.com/u/12811571?s=100&v=4",
                    @"https://avatars1.githubusercontent.com/u/20202234?s=100&v=4",
                    @"https://avatars2.githubusercontent.com/u/10665968?s=100&v=4",
                    @"https://avatars0.githubusercontent.com/u/16019751?s=100&v=4",
                    @"https://avatars3.githubusercontent.com/u/31841744?s=100&v=4",
                    @"https://avatars2.githubusercontent.com/u/4544519?s=100&v=4",
                    @"https://avatars1.githubusercontent.com/u/12547789?s=100&v=4",
                    @"https://avatars2.githubusercontent.com/u/11390582?s=100&v=4",
                    @"https://avatars0.githubusercontent.com/u/2271569?s=100&v=4",];
    
    localImagesArray = @[@"avatar_1.png",
                         @"avatar_2.jpg",
                         @"avatar_3.jpg",
                         @"avatar_4.png",
                         @"avatar_5.png",];
}

- (void)addOVCoinDynamicView {
    dynamicView = [[OVCoinDynamicView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
    dynamicView.backgroundColor = [UIColor redColor];
    [dynamicView configureWithNewCoin];
    [self.view addSubview:dynamicView];
}

- (void)addButtonToView {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 60, 300, 120, 44)];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"Add Remote" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickAddCoinButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *localButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 60, 360, 120, 44)];
    [self.view addSubview:localButton];
    [localButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [localButton setTitle:@"Add Local" forState:UIControlStateNormal];
    [localButton addTarget:self action:@selector(onClickAddLocalCoinButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickAddCoinButton:(UIButton *)sender {
    imageIndex++;
    if (imageIndex == imagesArray.count) {
        imageIndex = 0;
    }
    [dynamicView addCoinWithRadius:20 andImageURL:imagesArray[imageIndex]];
}

- (void)onClickAddLocalCoinButton:(UIButton *)sender {
    localImageIndex++;
    if (localImageIndex == localImagesArray.count) {
        localImageIndex = 0;
    }
    [dynamicView addCoinWithRadius:30 andImageName:localImagesArray[localImageIndex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
