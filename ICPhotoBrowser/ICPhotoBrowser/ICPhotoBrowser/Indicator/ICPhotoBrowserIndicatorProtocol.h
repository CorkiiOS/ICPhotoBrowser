//
//  ICPhotoBrowserIndicatorProtocol.h
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ICPhotoBrowserIndicatorProtocol <NSObject>

- (instancetype)initWithTotalPage:(NSInteger)totalPage currentIndex:(NSInteger)currentIndex;

- (void)setIndex:(NSInteger)index;

@end
