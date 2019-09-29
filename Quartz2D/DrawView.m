//
//  DrawView.m
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "DrawView.h"
#import "DrawPath.h"

@interface DrawView ()
@property (nonatomic, assign)CGPoint startP;
@property (nonatomic, assign) CGPoint currentP;
@property (nonatomic, strong)DrawPath *path;
@property (nonatomic, strong)NSMutableArray *paths;
@end

@implementation DrawView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self addGestureMethod];
}
- (NSMutableArray *)paths {
    if (!_paths) {
        _paths = [NSMutableArray array];
    }
    return _paths;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addGestureMethod];
    }
    return self;
}

- (void)addGestureMethod {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:pan];
}

//当手指拖动的时候调用
- (void)panAction: (UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.startP = [pan locationInView:self];
        self.path = [[DrawPath alloc]init];
        [self.path setLineWidth:self.lineWidth];
        self.path.pathColor = self.lineColor;
        [self.path moveToPoint:self.startP];
        [self.paths addObject:self.path];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        self.currentP = [pan locationInView:self];
        [self.path addLineToPoint:self.currentP];
        [self setNeedsDisplay];
    } else {
        
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    for (DrawPath *path in self.paths) {
        if ([path isKindOfClass:[UIImage class]]) {
            UIImage *image = (UIImage *)path;
//            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [image drawInRect:rect];
//            });

        } else {
            [path.pathColor set];
            [path stroke];
        }

    }
}

- (void)undo {
    [self.paths removeLastObject];
    [self setNeedsDisplay];
}
- (void)photo:(UIImage *)image {
    [self.paths addObject:image];
    [self setNeedsDisplay];
}

- (void)clear {
    [self.paths removeAllObjects];
    [self setNeedsDisplay];
}


@end
