//
//  CoreDataTodoRepository.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import <Foundation/Foundation.h>
#import "TodoRepository.h"
#import "TodoListApp-Swift.h"
@interface CoreDataTodoRepository : NSObject<TodoRepository>
-(instancetype)initWithTaskManager:(TaskCoreDataManager*)taskCoreDataManager;
@end


