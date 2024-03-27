//
//  TaskCell.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TaskCell.h"
#import "AppColors.h"
#import "UILabel+Strikethrough.h"

@interface TaskCell()
@property (nonatomic) TodoItem *task;
@property(nonatomic, weak) IBOutlet UILabel *taskLabel;
@property(nonatomic, weak) IBOutlet UILabel *taskDescriptionLabel;
@property(nonatomic, weak) IBOutlet UIView *containerView;
@property(nonatomic, weak) IBOutlet UIImageView *imageViewComplete;
@end

@implementation TaskCell


+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}



-(void)configureCellWith:(TodoItem*)item {
    _task = item;
    
    [self.taskDescriptionLabel setText:item.taskDescription];
    [self.taskDescriptionLabel setHidden:[item.taskDescription isEqualToString:@""]];
    
    if(item.isTaskCompleted) {
        [self.containerView setBackgroundColor:[UIColor backgroundWhite]];
        [self.imageViewComplete setHidden:FALSE];
        [self.taskLabel setStrikethroughText:item.taskTitle];
        [self.taskDescriptionLabel setHidden:TRUE];
    } else {
        [self.taskLabel setAttributedText:nil];
        NSLog(@"%@",item.taskTitle);
        [self.taskLabel setText:item.taskTitle];
        [self.containerView setBackgroundColor:[UIColor lightGreen]];
        [self.imageViewComplete setHidden:TRUE];
        [self.taskDescriptionLabel setHidden:FALSE];
    }
}


@end
