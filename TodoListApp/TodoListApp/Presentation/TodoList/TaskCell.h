//
//  TaskCell.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import <UIKit/UIKit.h>
#import "TodoItem.h"


@interface TaskCell : UITableViewCell
@property(nonatomic, weak) IBOutlet UILabel *taskLabel;
@property(nonatomic, weak) IBOutlet UILabel *taskDescriptionLabel;
@property(nonatomic, weak) IBOutlet UIView *containerView;
@property(nonatomic, weak) IBOutlet UIButton *buttonComplete;
+(NSString *)reuseIdentifier;
+(NSString *)nibName;
-(void)configureCellWith:(TodoItem*)item;
@end

