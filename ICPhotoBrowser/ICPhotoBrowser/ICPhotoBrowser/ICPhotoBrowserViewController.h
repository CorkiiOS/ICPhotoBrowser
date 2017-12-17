//
//  ICPhotoBrowserViewController.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYPictureBrowseInteractiveAnimatedTransition.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ICPhotoBrowserControlType) {
    ICPhotoBrowserControlTypeNone = 0,
    ICPhotoBrowserControlTypeSystem,
    ICPhotoBrowserControlTypeText
};

@interface ICPhotoBrowserViewController : UIViewController

@property (nonatomic, strong) NSArray *groupImageURLs;

@property (nonatomic, assign) ICPhotoBrowserControlType indicatorType;

@property (nonatomic, strong) LYPictureBrowseInteractiveAnimatedTransition *animatedTransition;

@property (nonatomic, strong, nullable) NSArray *groupThumbnailImageURLs;

@end

NS_ASSUME_NONNULL_END
