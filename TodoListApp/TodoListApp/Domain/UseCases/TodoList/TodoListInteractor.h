//
//  TodoListInteractor.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//
#import "TodoRepository.h"
@import Foundation;
@class TodoItem;

@interface TodoListInteractor : NSObject
@property (nonatomic, strong) id<TodoRepository> todoRepository;
- (instancetype)initWithTodoRepository:(id<TodoRepository>)todoRepository;
-(NSArray *)fetchAllTask;
- (void)addTodoItemWithTitle:(NSString *)title andDescription:(NSString *)description;

@end
