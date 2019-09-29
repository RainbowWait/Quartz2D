//
//  MatrixHandlView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MatrixHandlView.h"

@implementation MatrixHandlView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(-20, -20, 100, 60)];
    CGContextTranslateCTM(context, 100, 100);
    CGContextScaleCTM(context, 2.0, 2.0);
    CGContextRotateCTM(context, M_PI_2);
    
    [path fill];
    CGContextAddPath(context, path.CGPath);
    CGContextStrokePath(context);
    
    
}


@end
