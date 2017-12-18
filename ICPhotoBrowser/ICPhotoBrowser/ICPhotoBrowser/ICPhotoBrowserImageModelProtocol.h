//
//  ICPhotoBrowserImageModelProtocol.h
//  ICPhotoBrowser
//
//  Created by mac on 2017/12/18.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ICPhotoBrowserImageModelProtocol <NSObject>

- (NSString *)imageURL;

- (NSString *)thumbImgURL;

- (UIImageView *)photoBrowserImageView;

@end
