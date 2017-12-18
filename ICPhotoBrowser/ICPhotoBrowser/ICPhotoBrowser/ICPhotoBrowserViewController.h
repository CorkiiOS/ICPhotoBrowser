//
//  ICPhotoBrowserViewController.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYPictureBrowseInteractiveAnimatedTransition.h"
#import "ICPhotoBrowserImageModelProtocol.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ICPhotoBrowserControlType) {
    ICPhotoBrowserControlTypeNone = 0,
    ICPhotoBrowserControlTypeSystem,
    ICPhotoBrowserControlTypeText
};

typedef NS_ENUM(NSInteger, ICPhotoBrowserTransitionType) {
    ICPhotoBrowserTransitionTypeNone = 0,
    ICPhotoBrowserTransitionTypeSystemPhoto
};

@interface ICPhotoBrowserViewController : UIViewController

@property (nonatomic, assign) ICPhotoBrowserControlType indicatorType;

@property (nonatomic, assign) ICPhotoBrowserTransitionType transitionType;

@property (nonatomic, assign) NSInteger transitionIndex;

@property (nonatomic, strong) NSArray *transitionListFrames;

@property (nonatomic, strong) UIImageView *currentImageView;

@property (nonatomic, strong) NSMutableArray<ICPhotoBrowserImageModelProtocol> *groupImageModels;

@end

NS_ASSUME_NONNULL_END
