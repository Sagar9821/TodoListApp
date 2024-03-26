//
//  CoreDataTodoRepository.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "CoreDataTodoRepository.h"
#import "TodoItem.h"
#import "TodoListApp-Swift.h"

@implementation CoreDataTodoRepository

- (NSArray *)fetchAllTask {
    // Fetch todo items from Core Data
    TaskCoreDataManager *manager = [[TaskCoreDataManager alloc] init];
    return [manager fetchAllData];
}

-(void)addTodoItem:(TodoItem *)todoItem {
    // Save todo item to Core Data
    TaskCoreDataManager *manager = [[TaskCoreDataManager alloc] init];
   
    
    [manager insertWithTask:todoItem withCompletion:^(NSError *error) {
        NSLog(@"%@",error.localizedDescription);
    }];
    
    
    
}

-(void)updateTodoItem:(TodoItem *)todoItem {
    TaskCoreDataManager *manager = [[TaskCoreDataManager alloc] init];
    [manager updatTaskWithTask:todoItem withCompletion:^(NSError * error) {
        NSLog(@"%@",error.localizedDescription);
    }];
}

@end
