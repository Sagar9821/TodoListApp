//
//  TodoListInteractor.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TodoListInteractor.h"
#import "TodoItem.h"
@implementation TodoListInteractor

- (instancetype)initWithTodoRepository:(id<TodoRepository>)todoRepository {
    self = [super init];
    if (self) {
        _todoRepository = todoRepository;
    }
    return self;
}

-(NSArray *)fetchAllTask {
    return [self.todoRepository fetchAllTask];
}

- (NSMutableArray<TodoItem *> *)tasksForDate:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSMutableArray<TodoItem *> *tasksForDate = [NSMutableArray array];
    
    for (TodoItem *item in [self.todoRepository fetchAllTask]) {
        // Extract year, month, and day components from creationDate
        NSDateComponents *itemComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:item.creationDate];
        NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:date];
        
        // Compare year, month, and day components to check if they match
        if (itemComponents.year == dateComponents.year &&
            itemComponents.month == dateComponents.month &&
            itemComponents.day == dateComponents.day) {
            [tasksForDate addObject:item];
        }
    }
    
    return tasksForDate;
}

-(void)addTodoItemWithTitle:(NSString *)title andDescription:(NSString *)description {
    
}
-(void)completeTask:(TodoItem *)todoItem {
    [self.todoRepository updateTodoItem:todoItem];
}

- (NSArray<NSDate *> *)datesForCurrentYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:currentDate];
    NSInteger currentYear = [components year];
    return [self datesForYear:currentYear];
}

- (NSArray<NSDate *> *)datesForYear:(NSInteger)year {
    NSMutableArray<NSDate *> *dates = [NSMutableArray array];
    
    // Create a calendar instance
    NSCalendar *calendar = [NSCalendar currentCalendar];
    calendar.timeZone = [NSTimeZone defaultTimeZone];
    
    // Create date components for the first day of the year
    NSDateComponents *startComponents = [[NSDateComponents alloc] init];
    startComponents.year = year;
    startComponents.month = 1; // January
    startComponents.day = 1;
    
    // Create date object for the first day of the year
    NSDate *startDate = [calendar dateFromComponents:startComponents];
    
    // Get the number of days in the year
    NSRange daysRange = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitYear forDate:startDate];
    
    // Iterate through each day of the year
    for (NSInteger day = 0; day < daysRange.length; day++) {
        // Create date components for the current day
        NSDateComponents *dayComponents = [[NSDateComponents alloc] init];
        dayComponents.day = day;
        
        // Create date object for the current day
        NSDate *date = [calendar dateByAddingComponents:dayComponents toDate:startDate options:0];
        
        // Add the date to the array
        [dates addObject:date];
    }
    
    return dates;
}

-(void)deleteTask:(TodoItem*)task {
    [self.todoRepository deleteTask:task];
}
@end
