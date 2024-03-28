//
//  UIViewController+Reusable.h
//  TodoListApp
//
//  Created by psagc on 28/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UIViewController (Reusable)

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
         actionButtons:(NSArray<UIAlertAction *> *)actionButtons;

@end

NS_ASSUME_NONNULL_END
