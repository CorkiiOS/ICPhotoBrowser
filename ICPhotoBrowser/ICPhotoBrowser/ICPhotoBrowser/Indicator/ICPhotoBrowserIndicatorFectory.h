//
//  ICPhotoBrowserIndicatorFectory.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICPhotoBrowserViewController.h"
@protocol ICPhotoBrowserIndicatorProtocol;

@interface ICPhotoBrowserIndicatorFectory : NSObject

+ (UIView<ICPhotoBrowserIndicatorProtocol> *)indicatorWithType:(ICPhotoBrowserControlType)indicatorType
                                              totalPages:(NSInteger)totalPage
                                             currentPage:(NSInteger)currentPage;
@end
