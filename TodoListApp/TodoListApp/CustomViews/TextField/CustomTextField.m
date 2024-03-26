//
//  CustomTextField.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "CustomTextField.h"

@implementation CustomTextField


- (CGRect)textRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect([super textRectForBounds:bounds], self.textInsets);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return UIEdgeInsetsInsetRect([super editingRectForBounds:bounds], self.textInsets);
}

@end
