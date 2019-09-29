
//
//  ImageViewHandle.m
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ImageViewHandle.h"

@interface ImageViewHandle ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageViewHandle
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
     
}
- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc]init];
        _imageView.frame = self.frame;
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        [self setUpGesture];
    }
    return _imageView;
}
- (void)setUpGesture {
    //平移
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
//    pan.delegate = self;
    [_imageView addGestureRecognizer:pan];
    
    //旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
    [_imageView addGestureRecognizer:rotation];
    rotation.delegate = self;
    //缩放
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
    [_imageView
     addGestureRecognizer:pinch];
    pinch.delegate = self;
    
    //长按
    UILongPressGestureRecognizer *longGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longAction:)];
    [_imageView addGestureRecognizer:longGesture];
}

- (void)panAction: (UIPanGestureRecognizer *)sender {
    //获取手指的偏移量
    CGPoint transP = [sender  translationInView:self.imageView];
    //设置imageView的形变
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, transP.x, transP.y);
    //复位:只要想相对于上一次就必须复位
    [sender setTranslation:CGPointZero inView:self.imageView];
    
}

- (void)rotationAction: (UIRotationGestureRecognizer *)
sender {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, sender.rotation);
    sender.rotation = 0;
    
}
- (void)pinchAction: (UIPinchGestureRecognizer *)sender {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, sender.scale, sender.scale);
    sender.scale = 1;
    
}
- (void)longAction: (UILongPressGestureRecognizer *)sender {
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        //图片处理完毕
        //高亮的效果
        [UIView animateWithDuration:0.25 animations:^{
            self.imageView.alpha = 0;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.imageView.alpha = 1;
            } completion:^(BOOL finished) {
                //高亮完成的时候
                //把处理的图片生成一张新的图片,截屏
               //开启上下文
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                //把控件渲染到上下文
                [self.layer renderInContext:ctx];
                UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
                //关闭上下文
                UIGraphicsEndImageContext();
                //给drawView赋值
                self.ImageViewHandleCompletion(image);
                [self removeFromSuperview];
            }];
            
        }];
    }
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
