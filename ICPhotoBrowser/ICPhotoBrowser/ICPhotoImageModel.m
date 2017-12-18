//
//  ICPhotoImageModel.m
//  ICPhotoBrowser
//
//  Created by mac on 2017/12/18.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoImageModel.h"

@implementation ICPhotoImageModel

- (NSString *)imageURL {
    return _imageURL;
}

- (NSString *)thumbImgURL {
    return _imageURL;
}

- (UIImageView *)photoBrowserImageView {
    return self.imageView;
}


@end
