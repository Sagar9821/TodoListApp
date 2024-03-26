//
//  TaskTableView.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "UIKit/UIKit.h"
#import "TaskCell.h"
#import "TodoItem.h"

typedef void(^SelectedTaskBlock)(TodoItem  *item);


@interface TaskTableView :  NSObject <UITableViewDataSource,UITableViewDelegate>
-(instancetype)initWithArray:(NSArray *)tasks;
@property (nonatomic, copy) SelectedTaskBlock taskSelectedBlock;
@end


