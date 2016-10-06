//
//  AJScoreView2.m
//  AJScoreViewExample
//
//  Created by Aijun on 16/10/6.
//  Copyright © 2016年 Aijun. All rights reserved.
//

#import "AJScoreView2.h"

@implementation AJScoreView2


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
    
//    [[UIColor grayColor] setFill];
//    [starPath fill];
    
    //复制平移操作
    CGRect pathBounds = starPath.bounds;
    UIBezierPath *totalPath = [UIBezierPath bezierPath];
    for (int i = 0; i < 5; i ++) {
        
        UIBezierPath *copyPath = [UIBezierPath bezierPath];
        [copyPath appendPath:starPath];
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
    
}


@end
