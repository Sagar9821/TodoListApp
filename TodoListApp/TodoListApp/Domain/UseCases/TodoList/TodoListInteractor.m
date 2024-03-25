//
//  TodoListInteractor.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TodoListInteractor.h"

@implementation TodoListInteractor

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

-(void)addTodoItemWithTitle:(NSString *)title andDescription:(NSString *)description {
    
}
@end
