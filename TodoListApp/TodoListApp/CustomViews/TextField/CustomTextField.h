//
//  CustomTextField.h
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTextField : UITextField<UITextFieldDelegate>
@property (nonatomic, assign) UIEdgeInsets textInsets;

@end

NS_ASSUME_NONNULL_END
