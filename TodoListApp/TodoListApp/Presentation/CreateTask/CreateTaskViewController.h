//
//  CreateTaskViewController.h
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import <UIKit/UIKit.h>
#import "CreateTaskInteractor.h"
typedef void(^SaveTaskBlock)(void);
@interface CreateTaskViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, copy) SaveTaskBlock saveTaskBlock;
- (instancetype)initWithInteractor:(CreateTaskInteractor*)interactor;
@end


