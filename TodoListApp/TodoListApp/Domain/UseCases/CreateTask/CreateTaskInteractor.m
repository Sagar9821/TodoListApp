//
//  CreateTaskInteractor.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "CreateTaskInteractor.h"
#import "TodoItem.h"

@implementation CreateTaskInteractor
- (instancetype)initWithTodoRepository:(id<TodoRepository>)todoRepository {
    self = [super init];
    if (self) {
        _todoRepository = todoRepository;
    }
    return self;
}

-(NSArray *)fetchAllTask {
    return [self.todoRepository fetchAllTask];
}

-(void)addTodoItemWithTitle:(NSString *)title andDescription:(NSString *)description andCreateDate:(NSDate*)date{
    TodoItem *item = [[TodoItem alloc] initWithTitle:title andDescription:description andIsCompleted:FALSE andCreationDate:date];
    [self.todoRepository addTodoItem:item];
}
@end
