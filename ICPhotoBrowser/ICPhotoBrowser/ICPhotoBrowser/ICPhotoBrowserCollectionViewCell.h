//
//  ICPhotoBrowserCollectionViewCell.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICPhotoBrowserImageModel;

@interface ICPhotoBrowserCollectionViewCell : UICollectionViewCell

- (void)showWithModel:(ICPhotoBrowserImageModel *)model;

- (UIImage *)getImage;

- (CGRect)getImageFrame;

@end
