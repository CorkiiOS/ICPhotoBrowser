//
//  ICPhotoBrowserViewController.m
//  ICPhotoBrowser
//
//  Created by 王志刚 on 2017/12/17.
//  Copyright © 2017年 王志刚. All rights reserved.
//

#import "ICPhotoBrowserViewController.h"
#import "ICPhotoBrowserCollectionViewCell.h"
#import "ICPhotoBrowserImageModel.h"
#import "ICPhotoBrowserIndicatorProtocol.h"
#import "ICPhotoBrowserIndicatorFectory.h"

@interface ICPhotoBrowserViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView<ICPhotoBrowserIndicatorProtocol> *indicator;

@property (nonatomic, strong) NSMutableArray<ICPhotoBrowserImageModel *> *groupImages;

@property (nonatomic, assign) CGPoint transitionImgViewCenter;


@end

@implementation ICPhotoBrowserViewController

- (void)dealloc {
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSString *url in self.groupImageURLs) {
        ICPhotoBrowserImageModel *model = [ICPhotoBrowserImageModel new];
        model.imageURL = url;
        [self.groupImages addObject:model];
    }
    
    [[self collectionView] reloadData];
    
    self.indicator = [ICPhotoBrowserIndicatorFectory indicatorWithType:self.indicatorType totalPages:self.groupImages.count currentPage:0];
    [self.view addSubview:(UIView *)self.indicator];
    
    [self prefersStatusBarHidden];

    //指定对应图片
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    //添加滑动手势
    UIPanGestureRecognizer *interactiveTransitionRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Event
- (void)interactiveTransitionRecognizerAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    
    void (^excuteSubViewHiddenBlock)(BOOL) = ^(BOOL hidden) {
        self.collectionView.hidden = hidden;
        self.indicator.hidden = hidden;
        self.imageView.hidden = !hidden;
    };
    
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    
    CGFloat scale = 1 - (translation.y / self.view.bounds.size.height);
    scale = scale < 0 ? 0 : scale;
    scale = scale > 1 ? 1 : scale;
    
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan:{
            
            [self setupBaseViewControllerProperty:self.animatedTransition.transitionParameter.transitionImgIndex];
            
            excuteSubViewHiddenBlock(YES);
            
            self.animatedTransition.transitionParameter.gestureRecognizer = gestureRecognizer;
            [self dismissViewControllerAnimated:YES completion:nil];
            
            NSLog(@"bengin");
            
        }
            break;
        case UIGestureRecognizerStateChanged: {
            
            self.imageView.center = CGPointMake(self.transitionImgViewCenter.x + translation.x * scale, self.transitionImgViewCenter.y + translation.y);
            self.imageView.transform = CGAffineTransformMakeScale(scale, scale);

            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {

            if (scale > 0.95f) {
                [UIView animateWithDuration:0.2 animations:^{
                    self.imageView.center = self.transitionImgViewCenter;
                    self.imageView.transform = CGAffineTransformMakeScale(1, 1);
                    
                } completion:^(BOOL finished) {
                    self.imageView.transform = CGAffineTransformIdentity;
                }];
                excuteSubViewHiddenBlock(NO);

            }else{
            }
            self.animatedTransition.transitionParameter.transitionImage = self.imageView.image;
            self.animatedTransition.transitionParameter.currentPanGestImgFrame = self.imageView.frame;
            self.animatedTransition.transitionParameter.gestureRecognizer = nil;
        }
    }
}

#pragma mark - Private Method
- (void)setupBaseViewControllerProperty:(NSInteger)cellIndex{
    
    ICPhotoBrowserCollectionViewCell *cell = (ICPhotoBrowserCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    
    self.animatedTransition.transitionParameter.transitionImage = cell.getImage;
    self.animatedTransition.transitionParameter.transitionImgIndex = cellIndex;
    self.imageView.frame = cell.getImageFrame;
    self.imageView.image = cell.getImage;
    self.imageView.hidden = YES;
    self.transitionImgViewCenter = self.imageView.center;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / self.view.bounds.size.width;
    [self.indicator setIndex:index];
}

- (NSMutableArray *)groupImages {
    if (_groupImages == nil) {
        _groupImages = [NSMutableArray array];
    }
    return _groupImages;
}

- (UICollectionView *)collectionView {
    if (_collectionView == nil) {
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        flowLayout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundView = nil;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[ICPhotoBrowserCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ICPhotoBrowserCollectionViewCell class])];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.groupImages.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize size = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height);
    return size;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ICPhotoBrowserCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ICPhotoBrowserCollectionViewCell class]) forIndexPath:indexPath];
    [cell showWithModel:self.groupImages[indexPath.row]];
    return cell;
}

@end
