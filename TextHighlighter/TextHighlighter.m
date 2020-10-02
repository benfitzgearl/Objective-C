//
//  TextHighlighter.h
//  TextHighlighter
//
//  Created by Ben Fitzgearl  on 10/2/20.
//

#import "TextHighlighter.h"
#import <UIKit/UIKit.h>

@implementation TextHighlighter

- (id)init {
    
    self = [super init];
    return self;
}

- (void)highlightText:(NSString *)searchString inTextObject:(NSObject *)textObject {
    
    UITextView *textView = (UITextView *)textObject;
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment = textView.textAlignment;
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:textView.text attributes: @{NSParagraphStyleAttributeName:paragraphStyle}];
    [string addAttribute:NSForegroundColorAttributeName value:textView.textColor range:NSMakeRange(0, string.length)];
    NSArray *ranges = [self arrayOfRangesForSearchText:searchString inTextView:textView];
    for (NSValue *value in ranges) {
        NSRange highLightAt = [value rangeValue];
        [string addAttribute:NSBackgroundColorAttributeName value:[UIColor yellowColor] range:highLightAt];
    }
    [string addAttribute:NSFontAttributeName value:textView.font range:NSMakeRange(0, string.length)];
    textView.attributedText = string;
}

- (NSArray *)arrayOfRangesForSearchText:(NSString *)searchString inTextView:(UITextView *)textView {
    
    NSMutableArray *ranges = [[NSMutableArray alloc] init];
    if ([textView.text rangeOfString:searchString options:NSCaseInsensitiveSearch].location != NSNotFound) {
        NSInteger searchStringLength = [searchString length];
        NSString *subString = textView.text;
        NSInteger offset = 0;
        int i = 0;
        while (i < kMaxHighlightResults) {
            if ([subString rangeOfString:searchString options:NSCaseInsensitiveSearch].location == NSNotFound) {
                break;
            }
            NSInteger location = [subString rangeOfString:searchString options:NSCaseInsensitiveSearch].location + offset;
            [ranges addObject:[NSValue valueWithRange:NSMakeRange(location, searchStringLength)]];
            offset = location + searchStringLength;
            subString = [textView.text substringFromIndex:offset];
            i++;
        }
    }
    return ranges;
}

@end
