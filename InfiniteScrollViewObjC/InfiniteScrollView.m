//
//  InfiniteScrollView.m
//  InfiniteScrollViewObjC
//
//  Created by Ben Fitzgearl  on 7/2/18.
//  Copyright © 2018 Ben Fitzgearl . All rights reserved.
//

#import "InfiniteScrollView.h"

@implementation InfiniteScrollView

- (id)initWithScrollDirection:(ScrollViewScrollDirection)scrollingDirection {
    self = [super init];
    if (self) {
        scrollDirection = scrollingDirection;
        self.delegate = self;
        self.pagingEnabled = true;
        self.showsHorizontalScrollIndicator = false;
        self.showsVerticalScrollIndicator = false;
    }
    return self;
}

#pragma mark Subview management

- (void)drawSubviews:(CGRect)frame {
    
    self.frame = frame;
    if (scrollDirection == ScrollDirectionVertical) {
        self.contentSize = CGSizeMake(frame.size.width, kSupportedNumberOfSubviews * frame.size.height);
    } else {
        self.contentSize = CGSizeMake(kSupportedNumberOfSubviews * frame.size.width, frame.size.height);
    }
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    [self offsetToCenter];
}

- (void)insertLeftView:(UIView *)leftView andCenterView:(UIView *)centerView andRightView:(UIView *)rightView {
    
    [self insertLeftSubview:leftView];
    [self insertCenterSubview:centerView];
    [self insertRightSubview:rightView];
}

- (void)insertLeftSubview:(UIView *)subview {
    
    subview.frame = [self leftSubviewFrame];
    subview.tag = kLeftViewTag;
    [self addSubview:subview];
}

- (void)insertCenterSubview:(UIView *)subview {
    
    subview.frame = [self centerSubviewFrame];
    subview.tag = kCenterViewTag;
    [self addSubview:subview];
}

- (void)insertRightSubview:(UIView *)subview {
    
    subview.frame = [self rightSubviewFrame];
    subview.tag = kRightViewTag;
    [self addSubview:subview];
}

- (void)insertNewRightSubview:(UIView *)newRightSubview {
    
    UIView *curLeftView = [self viewWithTag:kLeftViewTag];
    UIView *curCenterView = [self viewWithTag:kCenterViewTag];
    UIView *curRightView = [self viewWithTag:kRightViewTag];
    if (curLeftView) {
        [curLeftView removeFromSuperview];
    }
    if (curCenterView) {
        curCenterView.frame = [self leftSubviewFrame];
        curCenterView.tag = kLeftViewTag;
    }
    if (curRightView) {
        curRightView.frame =[self centerSubviewFrame];
        curRightView.tag = kCenterViewTag;
    }
    newRightSubview.frame = [self rightSubviewFrame];
    newRightSubview.tag = kRightViewTag;
    [self addSubview:newRightSubview];
    [self offsetToCenter];
}

- (void)insertNewLeftSubview:(UIView *)newLeftSubview {
    
    UIView *curLeftView = [self viewWithTag:kLeftViewTag];
    UIView *curCenterView = [self viewWithTag:kCenterViewTag];
    UIView *curRightView = [self viewWithTag:kRightViewTag];
    if (curRightView) {
        [curRightView removeFromSuperview];
    }
    if (curCenterView) {
        curCenterView.frame = [self rightSubviewFrame];
        curCenterView.tag = kRightViewTag;
    }
    if (curLeftView) {
        curLeftView.frame = [self centerSubviewFrame];
        curLeftView.tag = kCenterViewTag;
    }
    newLeftSubview.frame = [self leftSubviewFrame];
    newLeftSubview.tag = kLeftViewTag;
    [self addSubview:newLeftSubview];
    [self offsetToCenter];
}

#pragma mark View Geometry

- (void)offsetToCenter {
    
    if (scrollDirection == ScrollDirectionHorizontal) {
        [self setContentOffset:CGPointMake(self.contentSize.width / kSupportedNumberOfSubviews, 0)];
    } else {
        [self setContentOffset:CGPointMake(0, self.contentSize.height / kSupportedNumberOfSubviews)];
    }
}

- (CGFloat)subviewWidth {
    
    return scrollDirection == ScrollDirectionHorizontal ? self.contentSize.width / kSupportedNumberOfSubviews : self.contentSize.width;
}

- (CGRect)leftSubviewFrame {
    
    return CGRectMake(0, 0, [self subviewWidth], self.frame.size.height);
}

- (CGRect)centerSubviewFrame {
    
    if (scrollDirection == ScrollDirectionVertical) {
        return CGRectMake(0, self.contentSize.height / kSupportedNumberOfSubviews,  [self subviewWidth], self.frame.size.height);
    }
    return CGRectMake(self.contentSize.width / kSupportedNumberOfSubviews, 0,  [self subviewWidth], self.frame.size.height);
}

- (CGRect)rightSubviewFrame {
    
    if (scrollDirection == ScrollDirectionVertical) {
        return CGRectMake(0, 2 * self.contentSize.height / kSupportedNumberOfSubviews,  [self subviewWidth], self.frame.size.height);
    }
    return CGRectMake(2 * self.contentSize.width / kSupportedNumberOfSubviews, 0,  [self subviewWidth], self.frame.size.height);
}

#pragma mark UIScrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    switch (scrollDirection) {
        case ScrollDirectionVertical:
            if (floorf(scrollView.contentOffset.y) > floorf(scrollView.contentSize.height / kSupportedNumberOfSubviews)) {
                [self didPageRight];
            } else if (floorf(scrollView.contentOffset.y) < floorf(scrollView.contentSize.height / kSupportedNumberOfSubviews)) {
                [self didPageLeft];
            }
            break;
        case ScrollDirectionHorizontal:
        default:
            if (floorf(scrollView.contentOffset.x) > floorf(scrollView.contentSize.width / kSupportedNumberOfSubviews)) {
                [self didPageRight];
            } else if (floorf(scrollView.contentOffset.x) < floorf(scrollView.contentSize.width / kSupportedNumberOfSubviews)) {
                [self didPageLeft];
            }
            break;
    }
}

- (void)didPageRight {
    
}

- (void)didPageLeft {
    
}

@end
