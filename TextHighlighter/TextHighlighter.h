//
//  TextHighlighter.h
//  TextHighlighter
//
//  Created by Ben Fitzgearl  on 10/2/20.
//


#import <Foundation/Foundation.h>

#define kMaxHighlightResults 100

@interface TextHighlighter : NSObject

- (id)init;
- (void)highlightText:(NSString *)searchString inTextObject:(NSObject *)textObject;

@end
