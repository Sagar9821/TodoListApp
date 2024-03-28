//
//  UIViewController+Reusable.m
//  TodoListApp
//
//  Created by psagc on 28/03/24.
//

#import "UIViewController+Reusable.h"



@implementation UIViewController (Reusable)

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message
             actionButtons:(NSArray<UIAlertAction *> *)actionButtons {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title
                                                                             message:message
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    // Add cancel button
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:cancelAction];
    
    if (actionButtons.count > 0) {
        for (UIAlertAction *actions in actionButtons) {
            [alertController addAction:actions];
        }
        
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}
@end
