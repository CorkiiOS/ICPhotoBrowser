//
//  ICPhotoBrowserPageControl.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserPageControl.h"

@implementation ICPhotoBrowserPageControl

- (instancetype)initWithTotalPage:(NSInteger)totalPage currentIndex:(NSInteger)currentIndex {
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self = [super init];
    if (self) {
        
        self.currentPageIndicatorTintColor = [UIColor lightGrayColor];
        self.pageIndicatorTintColor = [UIColor whiteColor];
        self.numberOfPages = totalPage;
        self.currentPage = currentIndex;
        self.center = CGPointMake(size.width / 2, size.height - 50);
        self.bounds = CGRectMake(0, 0, size.width, 30);
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setIndex:(NSInteger)index {
    self.currentPage = index;
}

@end
