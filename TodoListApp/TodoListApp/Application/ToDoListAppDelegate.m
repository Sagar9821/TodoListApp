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
#import "TodoRouter.h"

@interface ToDoListAppDelegate ()

@end

@implementation ToDoListAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    TodoRouter *router = [[TodoRouter alloc] initWithWindow: self.window];
    [router start];
    return YES;
}


@end
