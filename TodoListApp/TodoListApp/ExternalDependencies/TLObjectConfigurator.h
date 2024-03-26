@import Foundation;
#import "TodoListViewController.h"
#import "CreateTaskViewController.h"
#import "CoreDataTodoRepository.h"

@interface TLObjectConfigurator : NSObject
+(TLObjectConfigurator*)sharedInstance;
-(CoreDataTodoRepository*)coreDataTodoRepository;
-(TodoListViewController*)todoListController;
-(CreateTaskViewController*)createTaskController;

@end


