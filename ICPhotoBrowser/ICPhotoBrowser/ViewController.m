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
#import "ICPhotoImageModel.h"
#import <UIImageView+WebCache.h>
@interface ViewController ()
@property (nonatomic, strong) LYPictureBrowseInteractiveAnimatedTransition *animatedTransition;
- (NSArray *)imageArrays;
@end

@implementation ViewController {
    UIImageView *_imageView;
}

- (NSArray *)imageArrays {
    return @[@"http://upload-images.jianshu.io/upload_images/1455933-e20b26b157626a5d.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
             @"http://upload-images.jianshu.io/upload_images/1455933-cb2abcce977a09ac.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
             @"http://upload-images.jianshu.io/upload_images/1455933-92be2b34e7e9af61.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
             @"http://upload-images.jianshu.io/upload_images/1455933-cb2abcce977a09ac.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240",
             @"http://upload-images.jianshu.io/upload_images/1455933-92be2b34e7e9af61.JPG?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240"];
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
    NSMutableArray<ICPhotoBrowserImageModelProtocol>*array = (NSMutableArray<ICPhotoBrowserImageModelProtocol>*)[NSMutableArray array];
    for (NSInteger i = 0; i < 5; i ++) {
        ICPhotoImageModel *model = [ICPhotoImageModel new];
        model.imageURL = self.imageArrays[i];
        model.imageView = _imageView;
        [array addObject:model];
    }
    
    browser.transitionIndex = 2;
    browser.indicatorType = ICPhotoBrowserControlTypeSystem;
    browser.transitionType = ICPhotoBrowserTransitionTypeSystemPhoto;
    browser.groupImageModels = array;
    [self presentViewController:browser animated:YES completion:nil];
}

@end
