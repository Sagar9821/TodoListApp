@import Foundation;
#import "TodoListViewController.h"

@interface TLObjectConfigurator : NSObject
+(TLObjectConfigurator*)sharedInstance;
-(TodoListViewController*)todoListController;
@end


