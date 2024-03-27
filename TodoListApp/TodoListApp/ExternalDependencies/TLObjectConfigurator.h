@import Foundation;
#import "TodoListViewController.h"
#import "CreateTaskViewController.h"
#import "CoreDataTodoRepository.h"
#import "TodoListApp-Swift.h"
@interface TLObjectConfigurator : NSObject
+(TLObjectConfigurator*)sharedInstance;
-(TaskCoreDataManager*)taskCoreDataManager;
-(CoreDataTodoRepository*)coreDataTodoRepository;
-(TodoListViewController*)todoListController;
-(CreateTaskViewController*)createTaskController;
@end


