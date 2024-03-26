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
-(CoreDataTodoRepository *)coreDataTodoRepository {
    CoreDataTodoRepository *coreDataRepo = [[CoreDataTodoRepository alloc] init];
    return coreDataRepo;
}
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
