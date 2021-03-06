//
//  ICPhotoBrowserCollectionViewCell.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserCollectionViewCell.h"
#import "ICPhotoBrowserScrollView.h"
#import "ICPhotoBrowserImageModelProtocol.h"
@interface ICPhotoBrowserCollectionViewCell()

@property (nonatomic, strong) ICPhotoBrowserScrollView *imageContentView;
@property (nonatomic, strong) id<ICPhotoBrowserImageModelProtocol> model;

@end

@implementation ICPhotoBrowserCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        __weak typeof(self) weakSelf = self;
        [[self imageContentView] setSingleTapGestureBlock:^{
            __strong typeof(weakSelf) sSelf = weakSelf;
            if (sSelf.singleTapGestureBlock) {
                sSelf.singleTapGestureBlock();
            }
        }];
    }
    return self;
}

- (UIImage *)getImage {
    return self.imageContentView.imageView.image;
}

- (CGRect)getImageFrame {
    return self.imageContentView.imageView.frame;
}

- (void)showWithModel:(id<ICPhotoBrowserImageModelProtocol>)model {
    self.model = model;
    self.imageContentView.imageURL = [NSURL URLWithString:model.imageURL];
    
//    UIImageView *imageView = _pictureImageScrollView.zoomImageView;
//
//    UIImage * placeholderImage = [UIImage imageNamed:@"nodata"];
//    imageView.image = placeholderImage;
//    [self setPictureImage:placeholderImage];
//
//    if (model.image){
//        imageView.image = model.image;
//        [self setPictureImage:model.image];
//
//    }else if (model.imgUrl_thumb.length){
//        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:imageView.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            if(!error){
//                [self setPictureImage:image];
//            }
//        }];
//    }
//
//    if(model.imgUrl.length){
//        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:imageView.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//            if(!error){
//                [self setPictureImage:image];
//            }
//        }];
//    }
    
}

- (void)setPictureImage:(UIImage *)image{
 
}

- (ICPhotoBrowserScrollView *)imageContentView {
    if (!_imageContentView) {
        _imageContentView = [[ICPhotoBrowserScrollView alloc]initWithFrame:self.bounds];
        _imageContentView.backgroundColor = [UIColor blackColor];
        _imageContentView.zoomScale = 1.0f;
        [self.contentView addSubview:_imageContentView];
    }
    return _imageContentView;
}

@end
