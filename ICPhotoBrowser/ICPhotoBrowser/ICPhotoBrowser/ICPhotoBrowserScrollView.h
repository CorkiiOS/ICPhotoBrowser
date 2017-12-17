//
//  ICPhotoBrowserScrollView.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/16.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ICPhotoBrowserScrollView : UIScrollView

@property (nonatomic, strong) NSURL *imageURL;

@property (nonatomic, strong, readonly) UIImageView *imageView;


@end

NS_ASSUME_NONNULL_END
