//
//  ViewController.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/16.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ViewController.h"
#import "ICPhotoBrowserScrollView.h"
#import "ICPhotoBrowserViewController.h"
#import <UIImageView+WebCache.h>
@interface ViewController ()
@property (nonatomic, strong) LYPictureBrowseInteractiveAnimatedTransition *animatedTransition;

@end

@implementation ViewController {
    UIImageView *_imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(20, 100, 200, 150);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    [imageView sd_setImageWithURL:@"http://upload-images.jianshu.io/upload_images/1455933-e20b26b157626a5d.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    _imageView = imageView;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ICPhotoBrowserViewController *browser = [ICPhotoBrowserViewController new];
    browser.groupImageURLs = @[@"http://upload-images.jianshu.io/upload_images/1455933-e20b26b157626a5d.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                               @"http://upload-images.jianshu.io/upload_images/1455933-cb2abcce977a09ac.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                               @"http://upload-images.jianshu.io/upload_images/1455933-92be2b34e7e9af61.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                               @"http://upload-images.jianshu.io/upload_images/1455933-cb2abcce977a09ac.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
                               @"http://upload-images.jianshu.io/upload_images/1455933-92be2b34e7e9af61.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
    
    //封装参数对象
    LYPictureBrowseTransitionParameter *transitionParameter = [[LYPictureBrowseTransitionParameter alloc] init];
    transitionParameter.transitionImage = _imageView.image;
    transitionParameter.firstVCImgFrames = @[[NSValue valueWithCGRect:_imageView.frame]];
    transitionParameter.transitionImgIndex = 0;
    self.animatedTransition = nil;
    self.animatedTransition.transitionParameter = transitionParameter;
    
    //传输必要参数
  
    //设置代理
    browser.transitioningDelegate = self.animatedTransition;
    browser.indicatorType = ICPhotoBrowserControlTypeSystem;
    browser.animatedTransition = self.animatedTransition;
    [self presentViewController:browser animated:YES completion:nil];
}

- (LYPictureBrowseInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYPictureBrowseInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
