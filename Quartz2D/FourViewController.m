//
//  FourViewController.m
//  Quartz2D
//
//  Created by mac on 2019/7/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "FourViewController.h"
#import "DrawView.h"
#import "ImageViewHandle.h"

@interface FourViewController ()<UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet DrawView *drawView;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.drawView.lineWidth = self.slider.value;
    self.drawView.lineColor = [UIColor blackColor];
}
//清屏
- (IBAction)clearScreenAction:(UIBarButtonItem *)sender {
    [self.drawView clear];
}

//撤销
- (IBAction)cancel:(UIBarButtonItem *)sender {
    [self.drawView undo];
    
}
//橡皮擦
- (IBAction)easer:(UIBarButtonItem *)sender {
    self.drawView.lineColor = [UIColor whiteColor];
}
- (IBAction)photoAction:(UIBarButtonItem *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    NSLog(@"info = %@", info);
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    ImageViewHandle *imageHandle = [[ImageViewHandle alloc]init];
    imageHandle.frame = self.drawView.bounds;
    imageHandle.image = image;
    imageHandle.ImageViewHandleCompletion = ^(UIImage * _Nonnull image) {
        [self.drawView photo:image];
    };
    [self.drawView addSubview:imageHandle];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveAction:(UIBarButtonItem *)sender {

   //1.开启上下文
    UIGraphicsBeginImageContextWithOptions(self.drawView.bounds.size, NO, 0);
    //2.获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //3. 渲染图层
    [self.drawView.layer renderInContext:context];
    //4.获取当前上下文的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭上下文
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(newImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
}
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    if (error == nil) {
        NSLog(@"保存成功");
    }
}



- (IBAction)blueAction:(id)sender {
    self.drawView.lineColor = [UIColor blueColor];
}
- (IBAction)redAction:(id)sender {
    self.drawView.lineColor = [UIColor redColor];
}

- (IBAction)greenAction:(id)sender {
    self.drawView.lineColor = [UIColor greenColor];
}

- (IBAction)sliderAction:(UISlider *)sender {
    self.drawView.lineWidth = sender.value;
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
