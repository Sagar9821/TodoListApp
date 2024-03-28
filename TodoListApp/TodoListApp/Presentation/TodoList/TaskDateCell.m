//
//  TaskDateCell.m
//  TodoListApp
//
//  Created by psagc on 27/03/24.
//

#import "TaskDateCell.h"
#import "UIView+Reusable.h"
#import "AppColors.h"

@interface TaskDateCell()
@property(nonatomic, weak) IBOutlet UIView *containerView;
@property(nonatomic, weak) IBOutlet UILabel *taskDayLabel;
@property(nonatomic, weak) IBOutlet UILabel *taskDateLabel;
@property (nonatomic) NSDateFormatter *dateFormatter;
@end

@implementation TaskDateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (NSString *)nibName {
    return NSStringFromClass([self class]);
}

- (NSDateFormatter *)dateTimeFormatterWithFormate:(NSString*)formate{
    if (!_dateFormatter) {
        _dateFormatter = [[NSDateFormatter alloc] init];
    }
    [_dateFormatter setDateFormat:formate];
    return _dateFormatter;
}

-(void)configureCellWith:(NSDate*)date andSelected:(Boolean)isSelected {
    NSString *taskDay = [[self dateTimeFormatterWithFormate:@"EEE"] stringFromDate:date];
    [self.taskDayLabel setText:taskDay];
    NSString *taskDate = [[self dateTimeFormatterWithFormate:@"dd/MM"] stringFromDate:date];
    [self.taskDateLabel setText:taskDate];
    [self.containerView addCornerRadius:30];
    if(isSelected) {
        [self.containerView setBackgroundColor:[UIColor midBlue]];
        [self.taskDayLabel setTextColor:[UIColor whiteColor]];
        [self.taskDateLabel setTextColor:[UIColor whiteColor]];
        
    } else {
        [self.containerView setBackgroundColor:[UIColor whiteColor]];
        [self.taskDayLabel setTextColor:[UIColor midBlue]];
        [self.taskDateLabel setTextColor:[UIColor midBlue]];
    }
}
@end
