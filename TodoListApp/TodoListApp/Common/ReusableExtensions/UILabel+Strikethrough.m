//
//  UILabel+Strikethrough.m
//  TodoListApp
//
//  Created by psagc on 27/03/24.
//

#import "UILabel+Strikethrough.h"

@implementation UILabel (Strikethrough)

- (void)setStrikethroughText:(NSString *)text {
    if (!text) {
        self.attributedText = nil;
        return;
    }
    UIFont *font = [UIFont systemFontOfSize:20 weight:UIFontWeightRegular];
    NSDictionary *attributes = @{
        NSStrikethroughStyleAttributeName: @(NSUnderlineStyleSingle),
        NSFontAttributeName: font
    };
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    
    self.attributedText = attributedText;
}

@end
