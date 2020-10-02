//
//  InfiniteScrollView.h
//  InfiniteScrollViewObjC
//
//  Created by Ben Fitzgearl  on 7/2/18.
//  Copyright © 2018 Ben Fitzgearl . All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSupportedNumberOfSubviews 3
#define kLeftViewTag 100
#define kCenterViewTag 101
#define kRightViewTag 102

typedef enum {
    ScrollDirectionHorizontal = 0,
    ScrollDirectionVertical,
} ScrollViewScrollDirection;

@protocol InfiniteScrollViewDelegate < NSObject >
@optional
- (void)infiniteScrollViewDidPageRight;
- (void)infiniteScrollViewDidPageLeft;
@end

@interface InfiniteScrollView : UIScrollView < UIScrollViewDelegate > {
    
    ScrollViewScrollDirection scrollDirection;
}

@property (nonatomic, weak) id< InfiniteScrollViewDelegate > infiniteScrollViewDelegate;

- (id)initWithScrollDirection:(ScrollViewScrollDirection)scrollingDirection;
- (void)drawSubviews:(CGRect)frame;
- (void)insertLeftView:(UIView *)leftView andCenterView:(UIView *)centerView andRightView:(UIView *)rightView;
- (void)insertLeftSubview:(UIView *)subview;
- (void)insertCenterSubview:(UIView *)subview;
- (void)insertRightSubview:(UIView *)subview;
- (void)insertNewRightSubview:(UIView *)newRightSubview;
- (void)insertNewLeftSubview:(UIView *)newLeftSubview;
- (void)didPageRight;
- (void)didPageLeft;

@end

