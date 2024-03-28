//
//  TLObjectConfigurator.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TLObjectConfigurator.h"
#import "TodoListViewController.h"
#import "TodoListInteractor.h"
#import "TodoRepository.h"
#import "CoreDataTodoRepository.h"
#import "CreateTaskInteractor.h"

@implementation TLObjectConfigurator

#pragma mark - Creating object configurator

+ (TLObjectConfigurator *)sharedInstance {
    static TLObjectConfigurator *sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

#pragma mark - Creating CoreData Repo
-(TaskCoreDataManager*)taskCoreDataManager {
    TaskCoreDataManager *taskManager = [[TaskCoreDataManager alloc] init];
    return taskManager;
}
-(CoreDataTodoRepository *)coreDataTodoRepository {
    CoreDataTodoRepository *coreDataRepo = [[CoreDataTodoRepository alloc] initWithTaskManager:self.taskCoreDataManager];
    return coreDataRepo;
}

#pragma mark - Creating Controllers
-(TodoListViewController*)todoListController {
    TodoListInteractor *interactor = [[TodoListInteractor alloc] initWithTodoRepository:[self coreDataTodoRepository]];
    TodoListViewController *todoListVc = [[TodoListViewController alloc] initWithInteractor:interactor];
    return todoListVc;
}

-(CreateTaskViewController*)createTaskController {    
    CreateTaskInteractor *interactor = [[CreateTaskInteractor alloc] initWithTodoRepository:[self coreDataTodoRepository]];
    CreateTaskViewController *createTaskVc = [[CreateTaskViewController alloc] initWithInteractor:interactor];
    return createTaskVc;
}
@end
