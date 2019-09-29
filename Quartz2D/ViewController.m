//
//  ViewController.m
//  Quartz2D
//
//  Created by mac on 2019/7/25.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
#import "PieView.h"
#import "BarView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *progressLab;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@property (weak, nonatomic) IBOutlet PieView *pieView;
@property (weak, nonatomic) IBOutlet BarView *barView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.pieView.dataArray = @[@110,@200, @120,@70,@20,@180, @300, @5, @250];
//    self.barView.dataArray = @[@110,@2000, @120,@70,@20,@180, @300, @5, @250];

}

- (IBAction)progressChanged:(UISlider *)sender {
    self.progressLab.text = [NSString stringWithFormat:@"%.2f%%",sender.value * 100];
    self.progressView.progress = sender.value;
}

@end
