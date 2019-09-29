
//
//  BarView.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BarView.h"

@implementation BarView
- (void)setDataArray:(NSArray<NSNumber *> *)dataArray {
    _dataArray = dataArray;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    float sum = 0.0;
    for (NSNumber *value in self.dataArray) {
        sum += [value floatValue];
    }
    CGFloat width = rect.size.width / (self.dataArray.count * 2-1);
    
    for (NSInteger i = 0; i < self.dataArray.count; i++) {
        float value = [self.dataArray[i] floatValue];
       CGFloat x = 2 * width * i;
        CGFloat height = value/ sum  * rect.size.height;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x,rect.size.height - height, width, height)];
                [[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0] set];
        [path fill];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}


@end
