

//
//  ThreeViewController.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //
//    self.img.image = [UIImage imageNamed:@"6448355_204110337000_2"];
    
   
    
    
}

- (void)addRound {
    //图片裁剪成圆
    UIImage *image = [UIImage imageNamed:@"6448355_204110337000_2"];
    //1.获取上下文
    //opaque: 不透明
    //scale: 缩放比例 0为不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    CGFloat imageWidth = image.size.width;
    CGFloat border = 3.5;
    //画圆环
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imageWidth , imageWidth)];
    [[UIColor yellowColor] set];
    [path fill];
    //设置图形裁剪区域,正切与图片
    //创建图形的路径
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWidth - 2 * border, imageWidth - 2 * border)];
    //    [[UIColor orangeColor]set];
    //    [path stroke];
    //把路径设置为裁剪的区域
    [clipPath addClip];
    //绘制图片
    [image drawAtPoint:CGPointMake(border, border)];
    //从上下文中获取图片
    UIImage *newImage =  UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    NSLog(@"%@",NSStringFromCGSize(newImage.size));
    self.img.image = newImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
