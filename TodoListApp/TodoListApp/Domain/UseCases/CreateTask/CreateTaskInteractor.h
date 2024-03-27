//
//  CreateTaskInteractor.h
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import <Foundation/Foundation.h>
#import "TodoRepository.h"

@interface CreateTaskInteractor  : NSObject
@property (nonatomic, strong) id<TodoRepository> todoRepository;
- (instancetype)initWithTodoRepository:(id<TodoRepository>)todoRepository;
-(NSArray *)fetchAllTask;
-(void)addTodoItemWithTitle:(NSString *)title andDescription:(NSString *)description andCreateDate:(NSDate*)date;

@end

