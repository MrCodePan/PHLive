//
//  AdtView.m
//  app
//
//  Created by bill on 14-4-14.
//  Copyright (c) 2014年 _Gear. All rights reserved.
//

#define f_PageCtr_w     30
#define f_scroll_time   3


#import "AdView.h"

@interface AdView () <UIScrollViewDelegate>
{
    UIScrollView    *_scroView;
    UIPageControl   *_pageControl;
}

@property (nonatomic, assign) NSInteger _currPage;
@property (nonatomic, strong) NSTimer* scrolTimer;


@property (nonatomic, strong) NSArray* dataItem;
@property (nonatomic, copy) TBlock callBack;

@end

@implementation AdView


/// 自动滚动: start  YES:开 NO:关
-(void) dragStart
{
    [self.scrolTimer invalidate];
    self.scrolTimer = nil;
}

/// 自动滚动: start  YES:开 NO:关
-(void) dragStop
{
    self.scrolTimer = [NSTimer timerWithTimeInterval:f_scroll_time target:self selector:@selector(scrollAnimition) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.scrolTimer forMode:NSRunLoopCommonModes];
}

/// 自动滚动: start  YES:开 NO:关
-(void) startAutoScroll:(BOOL)start
{
//    start = 0; f_scroll_time
    if (start) {
        self.scrolTimer = [NSTimer timerWithTimeInterval:f_scroll_time target:self selector:@selector(scrollAnimition) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.scrolTimer forMode:NSRunLoopCommonModes];
        [self.scrolTimer fire];
        
    }else{
        [self.scrolTimer invalidate];
        self.scrolTimer = nil;
    }
}

/// 自动滚动
-(void) scrollAnimition;
{
    _scroView.userInteractionEnabled = NO;
    [self setOffsetWithPage:self._currPage+1 animated:YES];
}

-(void) setOffsetWithPage:(NSInteger)page animated:(BOOL)animated
{
    if (page > [self.dataItem count]+1) {
        page = 0;
    }else if (page < 0){
        page = [self.dataItem count]-1;
    }
    
    CGPoint offset = CGPointMake(F_DEVICE_W*(page+1), 0);
    [_scroView setContentOffset:offset animated:animated];
}


#pragma mark - -------- 响应 ----------
/// 点击回调
- (void)btnClick:(UIButton*)button
{
    if (self.callBack /*&& (self._currPage > -1)*/ && (self._currPage < [self.dataItem count])) {
        id item = [self.dataItem objectAtIndex:self._currPage];
        self.callBack(item);
    }
}

-(void) refreshWithItem:(id)item callBack:(TBlock)callBack
{
    if (item && [item isKindOfClass:[NSArray class]]) {
        self.dataItem = item;
        self.callBack = callBack;
        
        [self layoutView];
    }else{
        NSLog(@"--- 数据出错");
    }
}

#pragma mark - -------- 布局 ----------

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self._currPage = -1;
    
    
    UIScrollView *tScrollView = nil;
    tScrollView = [[UIScrollView alloc] init];
    tScrollView.frame = CGRectMake(0, 0, F_DEVICE_W, f_Ad_Content_H);
    tScrollView.delegate = self;
    tScrollView.tag = 300;
    [tScrollView setPagingEnabled:YES];
    [tScrollView setShowsHorizontalScrollIndicator:NO];
    [tScrollView setShowsVerticalScrollIndicator:NO];
    [self addSubview:tScrollView];
    _scroView = tScrollView;
    
    /// 焦点
    CGRect controlFrame = CGRectMake(self.frame.size.width - f_PageCtr_w - 10, f_Ad_Content_H - 20, (f_PageCtr_w/2), 10);
    _pageControl = [[UIPageControl alloc] initWithFrame:controlFrame];
    _pageControl.hidesForSinglePage = YES;
    [_pageControl addTarget:self action:@selector(pageControlIndexChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_pageControl];
    _pageControl.center = CGPointMake(F_DEVICE_W/2, F_DEVICE_W/3 - 15);
    
    return self;
}

/// 刷新视图
- (void)layoutView
{
    for (UIView* view in _scroView.subviews) {
        [view removeFromSuperview];
    }
    if (self.dataItem.count==0) {
        return;
    }
    NSArray* _listItem = self.dataItem;
    
    NSInteger adNum = _listItem.count;

    _pageControl.numberOfPages = adNum;
    _pageControl.currentPage = 0;
    [_scroView setContentSize:CGSizeMake(f_Ad_Content_W * (adNum+2), f_Ad_Content_H)];


    for (int i = 0; i < adNum+2; i++) {
        NSInteger realIdx = i-1;
        if (i==0) {
            realIdx = _listItem.count-1;
        }else if (i==adNum+1) {
            realIdx = 0;
        }

        id item = [_listItem objectAtIndex:realIdx];

//        DLog(@" ==> %@",item);
        UIImageView *tImgView = nil;
        tImgView = [[UIImageView alloc] init];
        tImgView.frame = CGRectMake(i * f_Ad_Content_W, 0, f_Ad_Content_W, F_DEVICE_W/3);
        [_scroView addSubview:tImgView];
//        tImgView.backgroundColor = [UIColor blackColor];
        tImgView.contentMode = UIViewContentModeScaleAspectFill;
        tImgView.clipsToBounds = YES;
        
//        NSURL* imgURL = [NSURL URLWithString:item[@"imgurl"]];
        
        UIButton* tButton = nil;
        tButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        tButton.frame = CGRectMake(0, 0, f_Ad_Content_W, f_Ad_Content_H);
        tButton.frame = CGRectMake(i * f_Ad_Content_W, 0, f_Ad_Content_W-2, F_DEVICE_W/3);
        tButton.tag = 50+i;
        [tButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_scroView addSubview:tButton];
        tImgView.image = [UIImage imageNamed:item];
//        [tImgView sd_setImageWithURL:item[@"adv_content"]];
//        [tImgView setImgURL:item[@"adv_content"] defaultImg:WEB_IMG_BANNER];

//        [tButton sd_setBackgroundImageWithURL:imgURL forState:UIControlStateNormal];
        
    }
    _scroView.contentOffset = CGPointMake(_scroView.width, 0);
    self._currPage = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint     p = [scrollView contentOffset];
    NSInteger   index = p.x/scrollView.width;
    
    NSInteger realIdx = index-1;
    if (index==0) {
        realIdx = self.dataItem.count-1;
    }else if (index==self.dataItem.count+1) {
        realIdx = 0;
    }

    index = realIdx;

    
    if (scrollView.tag == 300) {
        if (self._currPage != index) {
            self._currPage = index;
            _pageControl.currentPage = self._currPage;
            
            if (index <= [self.dataItem count] - 1) {
            }
        }
    }

}


- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    [self dragStart];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage =scrollView.contentOffset.x/scrollView.width;
    
    if (currentPage == self.dataItem.count+1) {
        
        [scrollView scrollRectToVisible:CGRectMake(scrollView.width,0,scrollView.width,scrollView.height) animated:NO];
        
    } else if (currentPage == 0) {
        
        [scrollView scrollRectToVisible:CGRectMake(scrollView.width*(self.dataItem.count),0,scrollView.width,scrollView.height) animated:NO];
    }
    [self dragStop];

}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSInteger currentPage =scrollView.contentOffset.x/scrollView.width;
    
    if (currentPage == self.dataItem.count+1) {
        [scrollView setContentOffset:CGPointMake(scrollView.width, 0) animated:NO];
    }
    _scroView.userInteractionEnabled = YES;
}

-(void) pageControlIndexChange:(UIPageControl*)pageControl
{
    if (pageControl.currentPage != self._currPage) {
        self._currPage = pageControl.currentPage;
        [self setOffsetWithPage:self._currPage+1 animated:YES];
    }
}

@end
