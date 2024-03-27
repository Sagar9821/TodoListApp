//
//  TaskCell.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import <UIKit/UIKit.h>
#import "TodoItem.h"


@interface TaskCell : UITableViewCell
+(NSString *)reuseIdentifier;
+(NSString *)nibName;
-(void)configureCellWith:(TodoItem*)item;
@end

