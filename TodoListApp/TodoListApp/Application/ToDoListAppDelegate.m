//
//  AppDelegate.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "ToDoListAppDelegate.h"
#import "TLObjectConfigurator.h"
#import "TodoListViewController.h"
#import <UIKit/UIKit.h>

@interface ToDoListAppDelegate ()

@end

@implementation ToDoListAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    TodoListViewController *todoListController = [[TLObjectConfigurator sharedInstance] todoListController];
    UINavigationController *todoListNavController = [[UINavigationController alloc] initWithRootViewController:todoListController];
    self.window.rootViewController = todoListNavController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
