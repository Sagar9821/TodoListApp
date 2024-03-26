//
//  TodoListViewController.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

@import UIKit;
@class TodoListInteractor;

typedef void(^CreateTaskBlock)(void);


@interface TodoListViewController : UIViewController
- (instancetype)initWithInteractor:(TodoListInteractor*)interactor;
@property (nonatomic, copy) CreateTaskBlock createTaskBlock;
@end

