//
//  ICPhotoBrowserCollectionViewCell.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICPhotoBrowserImageModel;
@protocol ICPhotoBrowserImageModelProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface ICPhotoBrowserCollectionViewCell : UICollectionViewCell

@property (nonatomic, copy) void(^singleTapGestureBlock)(void);

- (void)showWithModel:(id<ICPhotoBrowserImageModelProtocol>)model;

- (UIImage *)getImage;

- (CGRect)getImageFrame;

@end

NS_ASSUME_NONNULL_END
