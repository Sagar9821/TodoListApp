//
//  CoreDataTodoRepository.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "CoreDataTodoRepository.h"
#import "TodoItem.h"
#import "TodoListApp-Swift.h"
@interface CoreDataTodoRepository()
@property (nonatomic, strong) TaskCoreDataManager *taskCoreDataManager;
@end
@implementation CoreDataTodoRepository

-(instancetype)initWithTaskManager:(TaskCoreDataManager*)taskCoreDataManager {
    self = [super init];
    if (self) {
        _taskCoreDataManager = taskCoreDataManager;
    }
    return self;
}
- (NSArray *)fetchAllTask {
    // Fetch todo items from Core Data
    return [self.taskCoreDataManager fetchAllData];
}

-(void)addTodoItem:(TodoItem *)todoItem {
    // Save todo item to Core Data
    [self.taskCoreDataManager insertWithTask:todoItem withCompletion:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
    
}

-(void)updateTodoItem:(TodoItem *)todoItem {    
    [self.taskCoreDataManager updatTaskWithTask:todoItem withCompletion:^(NSError * error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
-(void)deleteTask:(TodoItem *)todoItem {
    [self.taskCoreDataManager deleteTaskWithTask:todoItem withCompletion:^(NSError * error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}
@end
