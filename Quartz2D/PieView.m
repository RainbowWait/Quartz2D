//
//  PieView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (void)drawRect:(CGRect)rect {

    float sum = 0.0;
    for (NSNumber *value in self.dataArray) {
        sum += [value floatValue];
    }
    
    CGFloat radius = rect.size.width * 0.5;
    CGPoint center = CGPointMake(radius, radius);
    CGFloat startA = 0;
    CGFloat angele = 0;
    CGFloat endA = 0;
    for (NSNumber *value in self.dataArray) {
        UIBezierPath *path = [UIBezierPath bezierPath];
        startA = endA;
        angele = [value floatValue]/sum * M_PI * 2;
        endA = endA + angele;
        [path addArcWithCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
        [path addLineToPoint:center];
        [[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0] set];
//        [path stroke];
        [path fill];
    }
}

- (void)setDataArray:(NSArray<NSNumber *> *)dataArray {
    _dataArray = dataArray;
    [self setNeedsDisplay];
}


@end
