//
//  ViewController.m
//  CATransition过渡
//
//  Created by 刘浩浩 on 16/6/27.
//  Copyright © 2016年 CodingFire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *imageView;
     NSArray *images;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    imageView=[[UIImageView alloc]initWithFrame:CGRectMake(80, 80, 150, 150)];
    [self.view addSubview:imageView];
    images = @[[UIImage imageNamed:@"1"],
                    [UIImage imageNamed:@"2"],
                    [UIImage imageNamed:@"3"],
                    [UIImage imageNamed:@"4"]];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 568-100, 280, 40);
    [btn setTitle:@"Switch 突兀" forState:UIControlStateNormal];
    btn.layer.cornerRadius=5;
    btn.layer.borderWidth=1;
    btn.layer.borderColor = [UIColor blackColor].CGColor;
    [btn addTarget:self action:@selector(switchImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(20, 568-50, 280, 40);
    [btn1 setTitle:@"Switch 平滑" forState:UIControlStateNormal];
    btn1.layer.cornerRadius=5;
    btn1.layer.borderWidth=1;
    btn1.layer.borderColor = [UIColor blackColor].CGColor;
    [btn1 addTarget:self action:@selector(switchImage1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];

    
}
-(void)switchImage
{
    UIImage *currentImage = imageView.image;
    NSUInteger index = [images indexOfObject:currentImage];
    index = (index + 1) % [images count];
    imageView.image = images[index];
}
- (void)switchImage1
{
    //set up crossfade transition
    CATransition *transition = [CATransition animation];
    //切换模式
    transition.type = kCATransitionFade;
    //apply transition to imageview backing layer
    [imageView.layer addAnimation:transition forKey:nil];
    //cycle to next image
    UIImage *currentImage = imageView.image;
    NSUInteger index = [images indexOfObject:currentImage];
    index = (index + 1) % [images count];
    imageView.image = images[index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
