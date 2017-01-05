//
//  testView.m
//  HYCircleLoadingViewExample
//
//  Created by liguangyi on 16/11/28.
//  Copyright © 2016年 Shadow. All rights reserved.
//

#import "testView.h"
static const CGFloat dashLayerMargin = 20;

@interface testView ()

@end
@implementation testView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubViews];
    }
    return self;
    
}

- (void)setUpSubViews {

    
//    self.bigBaseLayer = [CAShapeLayer layer];
//    self.bigBaseLayer.lineWidth =8.0f;
//    self.bigBaseLayer.strokeColor = [UIColor blueColor].CGColor;
//    self.bigBaseLayer.fillColor   = [UIColor clearColor].CGColor;
//    [self.layer addSublayer:self.bigBaseLayer];

    
    self.bigShapeLayer = [CAShapeLayer layer];
    self.bigShapeLayer.lineWidth =2.0f;
    self.bigShapeLayer.lineCap =  kCALineCapRound;
    self.bigShapeLayer.strokeColor = [UIColor grayColor].CGColor;
    self.bigShapeLayer.fillColor   = [UIColor clearColor].CGColor;
    [self.layer addSublayer:self.bigShapeLayer];

    
}

- (void)layoutSubviews {
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius = MIN(self.bounds.size.width, self.bounds.size.height)/2 - dashLayerMargin;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:- M_PI_2 endAngle: (M_PI * 2)- M_PI_2 clockwise:YES];
//    
    CGFloat bigRadius = radius + 8;
    UIBezierPath *oneBigPath = [UIBezierPath bezierPathWithArcCenter:center radius:bigRadius startAngle:- M_PI_2 endAngle: ((M_PI * 2)- M_PI_2 + M_PI*2) clockwise:YES];

//    self.shapeLayer.path = path.CGPath;
//    self.baseLayer.path = path.CGPath;
    
    self.bigBaseLayer.path = oneBigPath.CGPath;
    self.bigShapeLayer.path = oneBigPath.CGPath;
    
//    [self createGradientLayer];
    
}

@end
