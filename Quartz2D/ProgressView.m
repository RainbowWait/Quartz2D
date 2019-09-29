
//
//  ProgressView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

//注意:drawRect不能手动调用,因为图形上下文我们自己创建不了,只能由系统帮我们创建,并且传递给我们 
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.width / 2.0);
    [path addArcWithCenter:center radius:rect.size.width / 2.0 startAngle:-M_PI_2 endAngle:2 * M_PI * self.progress - M_PI_2 clockwise:YES];
    [path stroke];
}

- (void)setProgress:(float)progress {
    _progress = progress;
    [self setNeedsDisplay];
}


@end
