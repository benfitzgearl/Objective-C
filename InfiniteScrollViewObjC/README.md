# InfiniteScrollViewObjC

## Description
InfiniteScrollViewObjC is an Objective-C UIScrollView subclass that supports infinite horizontal or vertical paging. The class is designed to maintain three UIViews at a time; a left view (off-screen to the left), a center view (on-screen), and a right-view (off-screen to the right).

## Usage
Subclass InfiniteScrollViewObjC. Your subclass must overide these methods:

`- (void)drawSubviews:(CGRect)frame;`

`- (void)didPageRight;`

`- (void)didPageLeft;`

## Initialization
InfiniteScrollViewObjC can be initialized with a `ScrollDirectionHorizontal` argument, for horizontal paging, or a `ScrollDirectionVertical` argument, for vertical paging. See `ViewController.m` for an example.

## Method implementations
`- (void)drawSubviews:(CGRect)frame` is where you set up your views. It should have a call to `insertLeftView:andCenterViewandRightView:`, where the arguments are your custom left view, custom center view, and custom right view at load.

`- (void)didPageRight` gets called when the user pages right. Your implementation should call `insertRightSubview:` where the subview argument is your new right subview (one subview to the right of the most recent right subview).

`- (void)didPageLeft` gets called when the user pages left. Your implementation should call `insertLeftSubview:` where the subview argument is your new left subview (one subview to the left of the most recent left subview).

There's an optional delegate protocol, with methods for `infiniteScrollViewDidPageRight` and `infiniteScrollViewDidPageLeft`. These are appropriate to call from  `didPageRight` and `didPageLeft`, respectively.

## Other Info

See `NumbersScrollView.h/m` for a working subclass implementation.
