//
//  ICPhotoBrowserPageText.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserPageText.h"

@implementation ICPhotoBrowserPageText {
    NSInteger _totalPage;
}

- (instancetype)initWithTotalPage:(NSInteger)totalPage currentIndex:(NSInteger)currentIndex {
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    self = [super init];
    if (self) {
        self.center = CGPointMake(size.width / 2, size.height - 50);
        self.bounds = CGRectMake(0, 0, size.width, 30);
        self.userInteractionEnabled = NO;
        self.textAlignment = NSTextAlignmentCenter;
        self.numberOfLines = 0;
        self.textColor = [UIColor whiteColor];
        self.text = [NSString stringWithFormat:@"%zd / %zd", currentIndex + 1, totalPage];
        _totalPage = totalPage;
    }
    return self;
}

- (void)setIndex:(NSInteger)index {
    self.text = [NSString stringWithFormat:@"%zd / %zd", index + 1, _totalPage];
}



@end
