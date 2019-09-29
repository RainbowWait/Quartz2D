//
//  DrawImg.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "DrawImg.h"

@implementation DrawImg {
    CGFloat _snowY;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIImage *image = [UIImage imageNamed:@"xuehua-2"];
    [image drawAtPoint:CGPointMake(50, _snowY)];
    _snowY += 10;
    if (_snowY > rect.size.height ) {
        _snowY = 0;
    }
    
    
}
//如果再绘图的时候需要用到定时器,通常
//NSTimer 很少用于绘图,因为调度优先级比较低,并不会准时调用
- (void)awakeFromNib {
    [super awakeFromNib];
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(timeChange)];
    link.frameInterval = 5.0;
    [link addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}
//CADisplayLink :每次屏幕刷新的时候才会调用,屏幕一般一秒刷新60次.
- (void)timeChange {
    //注意: 这个方法并不会马上调用drawRect, 其实这个方法只是给当前孔家添加刷新的标记,等下一次屏幕刷新的时候才会调用drawRect
    [self setNeedsDisplay];
}


@end
