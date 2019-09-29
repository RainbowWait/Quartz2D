//
//  ShapeView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ShapeView.h"

@implementation ShapeView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    //
    UIBezierPath *path = [UIBezierPath bezierPath];
    //center 圆心
    //radius半径
    //startAngle 开始角度
    //endAngle结束角度
    //clockwise YES 顺时针 NO逆时针
    [path addArcWithCenter:CGPointMake(200, 150) radius:50 startAngle: M_PI_2 endAngle:0 clockwise:NO];
    [[UIColor yellowColor]setFill];
    [path addLineToPoint:CGPointMake(200, 150)];
    //关闭路径
    [path closePath];
    //渲染
    [path stroke];
    //填充 不用closePath,默认关闭路径了
    [path fill];
}

@end
