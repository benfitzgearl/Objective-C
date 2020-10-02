//
//  ViewController.m
//  InfiniteScrollViewObjC
//
//  Created by Ben Fitzgearl  on 7/2/20.
//  Copyright © 2020 Ben Fitzgearl . All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    numbersScrollView = [[NumbersScrollView alloc] initWithScrollDirection:ScrollDirectionHorizontal];
    numbersScrollView.infiniteScrollViewDelegate = self;
    numbersScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:numbersScrollView];
}

- (void)viewWillLayoutSubviews {
    
    [numbersScrollView drawSubviews:self.view.frame];
}

- (void)infiniteScrollViewDidPageLeft {
    
    NSLog(@"infiniteScrollViewDidPageLeft");
}

- (void)infiniteScrollViewDidPageRight {
    
    NSLog(@"infiniteScrollViewDidPageRight");
}


@end
