//
//  DrawText.m
//  Quartz2D
//
//  Created by mac on 2019/7/26.
//  Copyright © 2019 mac. All rights reserved.
//

#import "DrawText.h"

@implementation DrawText


- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIRectClip(CGRectMake(0, 0, 100, 100));
    UIImage *image = [UIImage imageNamed:@"分组 16 copy"];
    //默认绘制的内容尺寸跟图片尺寸一样大
//    [image drawAtPoint:CGPointZero];
    //把图片控制在绘制的内容范围内
//    [image drawInRect:rect];
    //平铺
    [image drawAsPatternInRect:rect];

    
}
- (void)attrText1 {
    //绘制文本
    NSString *text = @"哈哈哈打架了发健康就打了飞机打两份建档立卡减肥的拉手孔非建安路附近打了飞机放大镜服了搭建费老大解放大路福建省大了废旧塑料打开房间";
    //这个方法不会换行
    //    [text drawAtPoint:CGPointZero withAttributes:nil];
    //这个方法会换行
//    [text drawInRect:rect withAttributes:nil];
    
}
- (void)attrText {
    //绘制文本
    NSString *text = @"哈哈哈打架了";
    //文字起点
    NSMutableDictionary *textDic = [NSMutableDictionary dictionary];
    //设置文字颜色
    textDic[NSForegroundColorAttributeName] = [UIColor orangeColor];
    //设置文字字体
    textDic[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    //设置文字空心颜色好宽度
    textDic[NSStrokeWidthAttributeName] = @3;
    textDic[NSStrokeColorAttributeName] = [UIColor yellowColor];
    
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowOffset = CGSizeMake(3, 3);
    shadow.shadowBlurRadius = 2;
    textDic[NSShadowAttributeName] = shadow;
    [text drawAtPoint:CGPointZero withAttributes:textDic];
}


@end
