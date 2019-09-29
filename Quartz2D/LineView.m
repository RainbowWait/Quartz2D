

//
//  LineView.m
//  Quartz2D
//
//  Created by mac on 2019/7/25.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LineView.h"

@implementation LineView

//通常在这个方法里面绘制图形
//为什么要在drawRect里面绘制,只有这个方法才能获取到跟View的layer相关联的图形上下文
//什么时候调用: 当这个View要显示的时候才会调用drawRect绘制图形
//rect是当前视图的bounds
- (void)drawRect:(CGRect)rect {

}

//绘制曲线
- (void)drawQuadCurve1 {
    //如何绘制曲线
    //原生绘制方法
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //描述路径
    //设置起点
    CGContextMoveToPoint(context, 50, 350);
    //cpx:控制点的x
    /**
     cpx 控制点的x
     cpy: 控制点的y
     x :终点的x
     y: 终点的y
     CGContextAddQuadCurveToPoint(CGContextRef cg_nullable c,
     CGFloat cpx, CGFloat cpy, CGFloat x, CGFloat y)
     */
    CGContextAddQuadCurveToPoint(context, 150, 150, 250, 350);
    
    //渲染上下文
    CGContextStrokePath(context);

}


- (void)drawShape2
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 250)];
    [path addLineToPoint:CGPointMake(300, 250)];
    [path addLineToPoint:CGPointMake(50, 50)];
    path.lineWidth = 20;
    [[UIColor blackColor]setStroke];
    //连接样式 内切
    path.lineJoinStyle = kCGLineJoinBevel;
    //渲染
    [path stroke];
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(50, 270)];
    [path1 addLineToPoint:CGPointMake(50, 520)];
    [path1 addLineToPoint:CGPointMake(300, 520)];
    [path1 addLineToPoint:CGPointMake(50, 270)];
    path1.lineWidth = 10;
    [[UIColor yellowColor]setStroke];
    //连接样式 内切
    path1.lineJoinStyle = kCGLineJoinBevel;
    //渲染
    [path1 stroke];
}

//三角形
- (void)drawShape1 {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //描述路径
    CGContextMoveToPoint(context, 50, 50);
    CGContextAddLineToPoint(context, 50, 250);
    CGContextAddLineToPoint(context, 300, 250);
    //添加线
    CGContextAddLineToPoint(context, 50, 50);
    //设置绘图状态,一定要在渲染之前
    //线的颜色
    [[UIColor blueColor]setStroke];
    //线宽
    CGContextSetLineWidth(context, 20);
    //设置连接样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    //设置顶角样式
    CGContextSetLineCap(context, kCGLineCapRound);
    //渲染上下文
    CGContextStrokePath(context);
}
- (void)drawLine2 {
    //获取上下文
    //创建路径 UIBezierPath能获取到到当前上下文
    UIBezierPath *path = [UIBezierPath bezierPath];
    //设置起点
    [path moveToPoint:CGPointMake(10, 10)];
    //天机一根线到某个点
    [path addLineToPoint:CGPointMake(200, 100)];
    //绘制路径
    [path stroke];

}
- (void)drawLine1 {
    //获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //设置起点
    CGContextMoveToPoint(context, 10, 10);
    CGContextAddLineToPoint(context, 200, 100);
    //渲染上下文
    CGContextStrokePath(context);
}

- (void)drawLine {
    //1.获取图形上下文
    //目前我们所用的上下文都是以UIGraphics
    //CGContextRef Ref: 引用 CG: 目前使用到的类型和函数 一般都是CG开头 CoreGraphics的简称
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.描述路径
    CGMutablePathRef path = CGPathCreateMutable();
    //设置起点
    //path:给这个路径设置起点
    CGPathMoveToPoint(path, nil, 10, 10);
    //添加一根线到某个点
    CGPathAddLineToPoint(path, nil, 200, 100);
    //3.把路径添加到上下文
    CGContextAddPath(context, path);
    //4.渲染上下文
    CGContextStrokePath(context);
}


@end
