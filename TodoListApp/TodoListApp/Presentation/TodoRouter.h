//
//  TodoRouter.h
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TodoItem.h"


@interface TodoRouter : NSObject

@property (weak, nonatomic) UIWindow *window;

-(instancetype)initWithWindow:(UIWindow*)window;
-(void)start;
-(void)navigateToCreateTask;

@end

