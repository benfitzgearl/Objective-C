# TextHighlighter

## Description
TextHighlighter is an Objective-C class that adds background highlight color to visible text in UITextView, UITextField, or UILabel. The highlight is based on string matching. It will highlight up to an arbitrary number of instances of matching strings in your text object.

## Usage

Initialize an instance of TextHighlighter, then call the insance method:

`highlightText:(NSString *)<string to highlight> inTextObject:(NSObject *)<your text view>`

where the first argument is your search string, and the second argument is your text view object.

## Example

`TextHighlighter *highlighter = [[TextHighlighter alloc] init];`

`[highlighter highlightText:someSearchString inTextObject:someTextView];`

See ViewController.m for a fully functioning example.
