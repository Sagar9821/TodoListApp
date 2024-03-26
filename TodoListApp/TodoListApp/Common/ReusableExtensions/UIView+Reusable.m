//
//  UIView+Reusable.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "UIView+Reusable.h"

@implementation UIView (Reusable)

-(void)addCornerRadius:(CGFloat)cornerRadius {
    [[self layer] setCornerRadius:cornerRadius];
    [self setClipsToBounds:cornerRadius > 1 ? TRUE : FALSE];
}
@end
