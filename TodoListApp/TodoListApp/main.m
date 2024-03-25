//
//  main.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import <UIKit/UIKit.h>
#import "ToDoListAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([ToDoListAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
