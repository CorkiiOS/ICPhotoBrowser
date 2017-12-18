//
//  ICPhotoImageModel.h
//  ICPhotoBrowser
//
//  Created by mac on 2017/12/18.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICPhotoBrowserImageModelProtocol.h"
@interface ICPhotoImageModel : NSObject<ICPhotoBrowserImageModelProtocol>


@property (nonatomic, strong) NSString *imageURL;

@property (nonatomic, weak) UIImageView *imageView;

@end
