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

-(TodoListViewController*)todoListController {
    CoreDataTodoRepository *coreDataRepo = [[CoreDataTodoRepository alloc] init];
    TodoListInteractor *interactor = [[TodoListInteractor alloc] initWithTodoRepository:coreDataRepo];
    TodoListViewController *todoListVc = [[TodoListViewController alloc] initWithInteractor:interactor];
    return todoListVc;
}

@end
