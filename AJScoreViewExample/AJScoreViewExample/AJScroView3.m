//
//  AJScroView3.m
//  AJScoreViewExample
//
//  Created by Aijun on 16/10/8.
//  Copyright © 2016年 Aijun. All rights reserved.
//

#import "AJScroView3.h"

@implementation AJScroView3


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath* path3611Path = [UIBezierPath bezierPath];
    [path3611Path moveToPoint: CGPointMake(93.72, 242.19)];
    [path3611Path addCurveToPoint: CGPointMake(267.68, 68.23) controlPoint1: CGPointMake(206.18, 242.19) controlPoint2: CGPointMake(267.68, 149.02)];
    [path3611Path addCurveToPoint: CGPointMake(267.5, 60.33) controlPoint1: CGPointMake(267.68, 65.58) controlPoint2: CGPointMake(267.62, 62.95)];
    [path3611Path addCurveToPoint: CGPointMake(298, 28.67) controlPoint1: CGPointMake(279.44, 51.7) controlPoint2: CGPointMake(289.82, 40.93)];
    [path3611Path addCurveToPoint: CGPointMake(262.89, 38.29) controlPoint1: CGPointMake(287.05, 33.54) controlPoint2: CGPointMake(275.26, 36.82)];
    [path3611Path addCurveToPoint: CGPointMake(289.78, 4.48) controlPoint1: CGPointMake(275.51, 30.72) controlPoint2: CGPointMake(285.2, 18.75)];
    [path3611Path addCurveToPoint: CGPointMake(250.95, 19.32) controlPoint1: CGPointMake(277.96, 11.48) controlPoint2: CGPointMake(264.88, 16.57)];
    [path3611Path addCurveToPoint: CGPointMake(206.32, 0) controlPoint1: CGPointMake(239.79, 7.43) controlPoint2: CGPointMake(223.91, 0)];
    [path3611Path addCurveToPoint: CGPointMake(145.18, 61.13) controlPoint1: CGPointMake(172.56, 0) controlPoint2: CGPointMake(145.18, 27.38)];
    [path3611Path addCurveToPoint: CGPointMake(146.76, 75.07) controlPoint1: CGPointMake(145.18, 65.93) controlPoint2: CGPointMake(145.71, 70.6)];
    [path3611Path addCurveToPoint: CGPointMake(20.74, 11.19) controlPoint1: CGPointMake(95.95, 72.52) controlPoint2: CGPointMake(50.89, 48.19)];
    [path3611Path addCurveToPoint: CGPointMake(12.46, 41.92) controlPoint1: CGPointMake(15.49, 20.23) controlPoint2: CGPointMake(12.46, 30.72)];
    [path3611Path addCurveToPoint: CGPointMake(39.67, 92.82) controlPoint1: CGPointMake(12.46, 63.13) controlPoint2: CGPointMake(23.25, 81.86)];
    [path3611Path addCurveToPoint: CGPointMake(11.98, 85.17) controlPoint1: CGPointMake(29.64, 92.51) controlPoint2: CGPointMake(20.21, 89.75)];
    [path3611Path addCurveToPoint: CGPointMake(11.97, 85.95) controlPoint1: CGPointMake(11.97, 85.43) controlPoint2: CGPointMake(11.97, 85.68)];
    [path3611Path addCurveToPoint: CGPointMake(61.02, 145.88) controlPoint1: CGPointMake(11.97, 115.56) controlPoint2: CGPointMake(33.04, 140.28)];
    [path3611Path addCurveToPoint: CGPointMake(44.9, 148.04) controlPoint1: CGPointMake(55.88, 147.28) controlPoint2: CGPointMake(50.48, 148.04)];
    [path3611Path addCurveToPoint: CGPointMake(33.41, 146.93) controlPoint1: CGPointMake(40.96, 148.04) controlPoint2: CGPointMake(37.13, 147.65)];
    [path3611Path addCurveToPoint: CGPointMake(90.52, 189.4) controlPoint1: CGPointMake(41.19, 171.23) controlPoint2: CGPointMake(63.76, 188.9)];
    [path3611Path addCurveToPoint: CGPointMake(14.58, 215.57) controlPoint1: CGPointMake(69.6, 205.8) controlPoint2: CGPointMake(43.23, 215.57)];
    [path3611Path addCurveToPoint: CGPointMake(-0, 214.72) controlPoint1: CGPointMake(9.66, 215.57) controlPoint2: CGPointMake(4.79, 215.29)];
    [path3611Path addCurveToPoint: CGPointMake(93.72, 242.19) controlPoint1: CGPointMake(27.06, 232.07) controlPoint2: CGPointMake(59.19, 242.19)];
    path3611Path.miterLimit = 4;
    
    //复制平移操作
    CGRect pathBounds = path3611Path.bounds;
    UIBezierPath *totalPath = [UIBezierPath bezierPath];
    for (int i = 0; i < 5; i ++) {
        
        UIBezierPath *copyPath = [UIBezierPath bezierPath];
        [copyPath appendPath:path3611Path];
        [copyPath applyTransform:CGAffineTransformMakeTranslation((pathBounds.size.width + 5.0)*i,0)];
        
        [totalPath appendPath:copyPath];
    }
    
    //缩放操作
    CGRect totalPathRect = totalPath.bounds;
    CGFloat scale;
    if (totalPathRect.size.width / totalPathRect.size.height >= rect.size.width / rect.size.height) {
        scale = rect.size.width / totalPathRect.size.width;
    }else {
        scale = rect.size.height / totalPathRect.size.height;
    }
    [totalPath applyTransform:CGAffineTransformMakeScale(scale,scale)];
    
    //修正origin的x，y值, 使path位置居中
    totalPathRect = totalPath.bounds;
    CGFloat x = (rect.size.width - totalPathRect.size.width) / 2.0;
    x = x - totalPathRect.origin.x;
    CGFloat y = (rect.size.height - totalPathRect.size.height) / 2.0;
    y = y - totalPathRect.origin.y;
    [totalPath applyTransform:CGAffineTransformMakeTranslation(x, y)];
    
    [[UIColor greenColor] setFill];
    [totalPath fill];
    
    //确定选择的区域
    CGFloat score = 3.5;
    NSInteger i = floor(score);
    CGFloat decimal = score - i;
    CGFloat scaleW = pathBounds.size.width * scale;
    CGFloat scalePadding = 5.0 * scale;
    CGFloat selectW = (scaleW + scalePadding) * i + scaleW * decimal;
    CGRect selectRect = CGRectMake(0, 0, selectW, rect.size.height);
    UIBezierPath *selectRectPath = [UIBezierPath bezierPathWithRect:selectRect];
    
    [totalPath appendPath:selectRectPath];
    [totalPath setUsesEvenOddFillRule:YES];
    [totalPath addClip];
    
    [totalPath appendPath:selectRectPath];
    [totalPath setUsesEvenOddFillRule:YES];
    [totalPath addClip];
    [[UIColor grayColor] setFill];
    [totalPath fill];
    
}

@end
