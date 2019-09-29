//
//  DrawView.h
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView : UIView
//画笔线宽
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *lineColor;
/** 清屏 */
- (void)clear;
/** 撤销 */
- (void)undo;
- (void)photo: (UIImage *)image;
@end

NS_ASSUME_NONNULL_END
