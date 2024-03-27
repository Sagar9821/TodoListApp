//
//  TodoRepository.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

@import Foundation;
@class TodoItem;

@protocol TodoRepository <NSObject>

- (NSArray *)fetchAllTask;
- (void)addTodoItem:(TodoItem *)todoItem;
- (void)updateTodoItem:(TodoItem *)todoItem;
-(void)deleteTask:(TodoItem*)todoItem;
@end


