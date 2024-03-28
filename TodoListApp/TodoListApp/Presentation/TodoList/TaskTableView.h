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
typedef void(^DeleteTaskBlock)(TodoItem  *item);

@interface TaskTableView :  NSObject <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy) SelectedTaskBlock taskSelectedBlock;
@property (nonatomic, copy) DeleteTaskBlock taskDeleteBlock;
@property (nonatomic, strong) NSMutableArray *array;
-(instancetype)initWithArray:(NSMutableArray *)tasks;
@end


