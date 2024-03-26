//
//  TodoRouter.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "TodoRouter.h"
#import "TLObjectConfigurator.h"

@interface TodoRouter ()
@property (nonatomic, strong) UINavigationController *navigationController;
@end

@implementation TodoRouter

-(instancetype)initWithWindow:(UIWindow*)window {
    self = [super init];
    if (self) {
        self.window = window;
    }
    return self;
}

-(void)start {
    TodoListViewController *todoListController = [[TLObjectConfigurator sharedInstance] todoListController];
    todoListController.createTaskBlock = ^{
        [self navigateToCreateTask];
    };
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:todoListController];    
    [[[self navigationController] navigationBar] setPrefersLargeTitles:TRUE];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
}

-(void)navigateToCreateTask {
    CreateTaskViewController *createTask = [[TLObjectConfigurator sharedInstance] createTaskController];
    createTask.saveTaskBlock = ^{
        [[self navigationController] popViewControllerAnimated:TRUE];
    };
    [[self navigationController] pushViewController:createTask animated:TRUE];
}

@end
