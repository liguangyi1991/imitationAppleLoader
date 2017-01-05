//
//  ViewController.m
//  HYCircleLoadingViewExample
//
//  Created by Shadow on 14-3-7.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "ViewController.h"
#import "testView.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *startButton;
@property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic, strong) testView *test;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.test = [[testView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:self.test];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 300, 100, 100);
    button.titleLabel.text = @"开始";
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(dianjia) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}
- (void)dianjia
{
    // 创建动画组，并设置相关属性
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 1;
    animationGroup.repeatCount = INFINITY;
    animationGroup.removedOnCompletion = NO;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animationGroup.fillMode = kCAFillModeForwards;

    // strokeStart动画
    CABasicAnimation *strokeStartAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    strokeStartAnimation.fromValue = @0;
    strokeStartAnimation.toValue = @0.5;
    
    // strokeEnd动画
    CABasicAnimation *strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.fromValue = @0.45;
    strokeEndAnimation.toValue = @0.95;
    
    // 将动画加到动画组
    animationGroup.animations = @[strokeStartAnimation, strokeEndAnimation];
    [self.test.bigShapeLayer addAnimation:animationGroup forKey:@"progress"];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
