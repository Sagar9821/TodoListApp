//
//  TaskCell.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TaskCell.h"
#import "AppColors.h"

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
    [self.taskLabel setText:item.taskTitle];
    [self.taskDescriptionLabel setText:item.taskDescription];
    if(item.isTaskCompleted) {
        [self.containerView setBackgroundColor:[UIColor backgroundWhite]];
    } else {
        [self.containerView setBackgroundColor:[UIColor lightGreen]];
        [self.buttonComplete setHidden:TRUE];
        [self.taskDescriptionLabel setHidden:TRUE];
        
    }
    
}
#pragma mark Action Methods
-(IBAction)didTapOnComplete:(UIButton*)sender {
    [sender setSelected:!sender.selected];
}
@end
