//
//  ICPhotoBrowserScrollView.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/16.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserScrollView.h"
#import "ICPhotoBrowserAssert.h"
#import <UIImageView+WebCache.h>
#import "UIView+XLExtension.h"

@interface ICPhotoBrowserScrollView()<UIScrollViewDelegate>


@end

@implementation ICPhotoBrowserScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        self.delegate = self;
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        self.delegate = self;
        self.clipsToBounds = YES;
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.minimumZoomScale = 1.0;
        self.maximumZoomScale = 2.0;
        self.zoomScale = 1.0;
        
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.backgroundColor = [UIColor redColor];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
    }
    return self;
}

- (void)setImageURL:(NSURL *)imageURL {
    if (_imageURL != imageURL) {
        _imageURL = imageURL;
        
        if ([imageURL isKindOfClass:[NSString class]]) {
            imageURL = [NSURL URLWithString:(NSString *)imageURL];
        }
        
        if (!imageURL) {
            return;
        }
        
        [_imageView sd_setImageWithURL:imageURL placeholderImage:nil completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            [self setLayout];
        }];
        
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

- (void)setLayout {
    UIImage *image = self.imageView.image;
    if (image == nil || image.size.height==0) {
        return;
    }
    CGFloat imageWidthHeightRatio = image.size.width / image.size.height;
    self.imageView.xl_width = self.xl_width;
    self.imageView.xl_height = self.xl_width / imageWidthHeightRatio;
    self.imageView.xl_x = 0;
    if (self.imageView.xl_height > XLScreenH) {
        self.imageView.xl_y = 0;
        self.scrollEnabled = YES;
    } else {
        self.imageView.xl_y = (XLScreenH - self.imageView.xl_height ) * 0.5;
        self.scrollEnabled = NO;
    }
    self.maximumZoomScale = MAX(XLScreenH / self.imageView.xl_height, 3.0);
    self.minimumZoomScale = 1.0;
    self.zoomScale = 1.0;
    self.contentSize = CGSizeMake(self.imageView.xl_width, MAX(self.imageView.xl_height, XLScreenH));
}

- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView
{
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?
    (scrollView.bounds.size.width - scrollView.contentSize.width) * 0.5 : 0.0;
    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?
    (scrollView.bounds.size.height - scrollView.contentSize.height) * 0.5 : 0.0;
    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width * 0.5 + offsetX,
                                       scrollView.contentSize.height * 0.5 + offsetY);
    return actualCenter;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    _imageView.center = [self centerOfScrollViewContent:scrollView];
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view {
    self.scrollEnabled = YES;
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
    self.userInteractionEnabled = YES;
}

@end
