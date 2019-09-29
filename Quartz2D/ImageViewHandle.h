//
//  ImageViewHandle.h
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewHandle : UIView
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) void(^ImageViewHandleCompletion)(UIImage *image);
@end

NS_ASSUME_NONNULL_END
