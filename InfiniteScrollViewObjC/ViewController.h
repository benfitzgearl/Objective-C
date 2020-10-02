//
//  ViewController.h
//  InfiniteScrollViewObjC
//
//  Created by Ben Fitzgearl  on 7/2/20.
//  Copyright © 2020 Ben Fitzgearl . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumbersScrollView.h"

@interface ViewController : UIViewController < InfiniteScrollViewDelegate > {
    
    NumbersScrollView *numbersScrollView;
}

@end

