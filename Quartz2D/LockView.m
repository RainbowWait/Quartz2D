//
//  LockView.m
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LockView.h"

@interface LockView ()
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, assign) CGPoint currentPoint;
@end

@implementation LockView

- (NSMutableArray *)buttonArray {
    if (!_buttonArray) {
        _buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    for (NSInteger i = 0; i < 9; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        button.userInteractionEnabled = NO;
        button.tag = i;
        [self addSubview:button];
    }
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
}

- (void)panAction: (UIPanGestureRecognizer *)pan {
    self.currentPoint = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        for (UIButton *button in self.subviews) {
            if (CGRectContainsPoint(button.frame, self.currentPoint) && button.selected == NO) {
                button.selected = YES;
                [self.buttonArray addObject:button];
            }
            [self setNeedsDisplay];
        }
    } else if (pan.state == UIGestureRecognizerStateEnded){
        for (UIButton *button in self.buttonArray) {
            button.selected = NO;
        }
//        [self.buttonArray makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
        [self.buttonArray removeAllObjects];
        [self setNeedsDisplay];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat leftMargin = 20;
    CGFloat lineMarign = 20;
    CGFloat buttonWidth = 100;
    CGFloat columnMargin = (self.frame.size.width - 2 * leftMargin - buttonWidth * 3)/2;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        UIButton *button = self.subviews[i];
        button.frame = CGRectMake(leftMargin + i%3 * (buttonWidth + columnMargin) , i/3 * (buttonWidth + lineMarign), buttonWidth, buttonWidth);
    }
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (!self.buttonArray.count) {
        return;
    }
    UIBezierPath *path = [UIBezierPath bezierPath];
    [[UIColor redColor]setStroke];
    [path setLineWidth:10];
    [path setLineJoinStyle:kCGLineJoinRound];
    for (NSInteger i = 0; i < self.buttonArray.count; i++) {
        UIButton *button = self.buttonArray[i];
        if (i == 0) {
            [path moveToPoint:button.center];
        }
        [path addLineToPoint:button.center];
    }
    [path addLineToPoint:self.currentPoint];
    [path stroke];
    
}


@end
