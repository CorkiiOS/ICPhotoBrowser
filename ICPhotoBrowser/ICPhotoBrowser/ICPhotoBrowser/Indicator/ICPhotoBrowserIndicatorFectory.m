//
//  ICPhotoBrowserIndicatorFectory.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserIndicatorFectory.h"
#import "ICPhotoBrowserPageControl.h"
#import "ICPhotoBrowserPageText.h"

@implementation ICPhotoBrowserIndicatorFectory

+ (UIView<ICPhotoBrowserIndicatorProtocol> *)indicatorWithType:(ICPhotoBrowserControlType)indicatorType
                                             totalPages:(NSInteger)totalPage
                                            currentPage:(NSInteger)currentPage {
    UIView<ICPhotoBrowserIndicatorProtocol> *indicator = nil;
    switch (indicatorType) {
        case ICPhotoBrowserControlTypeSystem:
        {
            indicator = [[ICPhotoBrowserPageControl alloc] initWithTotalPage:totalPage currentIndex:currentPage];
            
        }
            break;
        case ICPhotoBrowserControlTypeText:
        {
            indicator = [[ICPhotoBrowserPageText alloc] initWithTotalPage:totalPage currentIndex:currentPage];
        }
            break;
            
        default:
            break;
    }
    return indicator;
}
@end
