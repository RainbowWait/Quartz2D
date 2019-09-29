
//
//  DifferentLineView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "DifferentLineView.h"

@implementation DifferentLineView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5);
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(10, rect.size.height/2)];
    [[UIColor redColor]setStroke];
    [path1 addLineToPoint:CGPointMake(rect.size.width - 20, rect.size.height/2)];
    CGContextAddPath(context, path1.CGPath);
    CGContextStrokePath(context);
    CGContextSaveGState(context);
    
    path1 = [UIBezierPath bezierPath];
    CGContextRestoreGState(context);
    CGContextSetLineWidth(context, 10);
    [path1 moveToPoint:CGPointMake((rect.size.width - 20)/2-5, 10)];
    [path1 addLineToPoint:CGPointMake((rect.size.width - 20)/2-5, rect.size.height - 20)];
    [[UIColor orangeColor]setStroke];
    CGContextAddPath(context, path1.CGPath);
    CGContextStrokePath(context);
    
}


@end
