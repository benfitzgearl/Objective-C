//
//  NumbersScrollView.m
//  InfiniteScrollViewObjC
//
//  Created by Ben Fitzgearl  on 7/2/20.
//  Copyright © 2020 Ben Fitzgearl . All rights reserved.
//

#import "NumbersScrollView.h"

@implementation NumbersScrollView

#pragma mark Superclass overrides

- (void)drawSubviews:(CGRect)frame {
    
    [super drawSubviews:frame];
    [self insertLeftView:[self numberView:currentDisplayNumber - 1] andCenterView:[self numberView:currentDisplayNumber] andRightView:[self numberView:currentDisplayNumber + 1]];
}

- (void)didPageRight {
    
    currentDisplayNumber += 1;
    [self insertNewRightSubview:[self numberView:currentDisplayNumber + 1]];
    if ([self.infiniteScrollViewDelegate respondsToSelector:@selector(infiniteScrollViewDidPageRight)]) {
        [self.infiniteScrollViewDelegate infiniteScrollViewDidPageRight];
    }
}

- (void)didPageLeft {
    
    currentDisplayNumber -= 1;
    [self insertNewLeftSubview:[self numberView:currentDisplayNumber - 1]];
    if ([self.infiniteScrollViewDelegate respondsToSelector:@selector(infiniteScrollViewDidPageLeft)]) {
        [self.infiniteScrollViewDelegate infiniteScrollViewDidPageLeft];
    }
}

#pragma mark View methods

- (UIView *)numberView:(NSInteger)numberToDisplay {
    
    UIView *numberView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    numberView.backgroundColor = [UIColor clearColor];
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, numberView.frame.size.height / 4, numberView.frame.size.width, numberView.frame.size.height / 2)];
    numberLabel.backgroundColor = [UIColor clearColor];
    numberLabel.textColor = [UIColor redColor];
    numberLabel.font = [UIFont boldSystemFontOfSize:120.0];
    numberLabel.textAlignment = NSTextAlignmentCenter;
    numberLabel.text = [NSString stringWithFormat:@"%ld", numberToDisplay];
    [numberView addSubview:numberLabel];
    return numberView;
}


@end
