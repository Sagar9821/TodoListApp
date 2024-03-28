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
#pragma mark - App Starting

-(void)start {
    TodoListViewController *todoListController = [[TLObjectConfigurator sharedInstance] todoListController];
    todoListController.createTaskBlock = ^(NSDate *date) {
        [self navigateToCreateTaskFor:date];
    };
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:todoListController];
    [[self.navigationController navigationBar] setTranslucent:FALSE];

    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    [self setUpappearance];
}

#pragma mark - Other navigations

-(void)navigateToCreateTaskFor:(NSDate*)date {
    CreateTaskViewController *createTask = [[TLObjectConfigurator sharedInstance] createTaskController];
    createTask.createDate = date;
    createTask.saveTaskBlock = ^{
        [[self navigationController] popViewControllerAnimated:TRUE];
    };
    [[self navigationController] pushViewController:createTask animated:TRUE];
}

-(void)setUpappearance {
    UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor whiteColor];
    [[UINavigationBar appearance] setStandardAppearance:appearance];
    [[UINavigationBar appearance] setScrollEdgeAppearance:appearance];
}
@end
