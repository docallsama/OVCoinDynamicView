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
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addOVCoinDynamicView];
}

- (void)addOVCoinDynamicView {
    dynamicView = [[OVCoinDynamicView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 200)];
    dynamicView.backgroundColor = [UIColor redColor];
    [dynamicView configureWithNewCoin];
    [self.view addSubview:dynamicView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 40, 300, 80, 44)];
    [self.view addSubview:button];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClickAddCoinButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClickAddCoinButton:(UIButton *)sender {
    [dynamicView addCoin];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
