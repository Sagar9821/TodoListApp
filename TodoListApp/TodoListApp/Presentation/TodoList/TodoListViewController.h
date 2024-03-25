//
//  TodoListViewController.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

@import UIKit;
@class TodoListInteractor;

@interface TodoListViewController : UIViewController
- (instancetype)initWithInteractor:(TodoListInteractor*)interactor;
@end

