//
//  AJScoreView1.m
//  AJScoreViewExample
//
//  Created by Aijun on 16/10/6.
//  Copyright © 2016年 Aijun. All rights reserved.
//

#import "AJScoreView1.h"

@implementation AJScoreView1


- (void)drawRect:(CGRect)rect {
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint: CGPointMake(56, 13)];
    [starPath addLineToPoint: CGPointMake(64.82, 25.86)];
    [starPath addLineToPoint: CGPointMake(79.78, 30.27)];
    [starPath addLineToPoint: CGPointMake(70.27, 42.64)];
    [starPath addLineToPoint: CGPointMake(70.69, 58.23)];
    [starPath addLineToPoint: CGPointMake(56, 53)];
    [starPath addLineToPoint: CGPointMake(41.31, 58.23)];
    [starPath addLineToPoint: CGPointMake(41.73, 42.64)];
    [starPath addLineToPoint: CGPointMake(32.22, 30.27)];
    [starPath addLineToPoint: CGPointMake(47.18, 25.86)];
    [starPath closePath];
    
    [[UIColor redColor] setFill];
    [starPath fill];
    
    //获取path的尺寸和位置
    CGRect pathBounds = starPath.bounds;
    pathBounds.size.width = pathBounds.size.width * 0.8;
    UIBezierPath *rectPath = [UIBezierPath bezierPathWithRect:pathBounds];
    
    [starPath appendPath:rectPath];
    [starPath setUsesEvenOddFillRule:YES];
    [starPath addClip];

    [starPath appendPath:rectPath];
    [starPath setUsesEvenOddFillRule:YES];
    [starPath addClip];
    [[UIColor grayColor] setFill];
    [starPath fill];
}


@end
