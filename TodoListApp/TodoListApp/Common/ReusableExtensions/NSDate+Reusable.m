//
//  NSDate+Reusable.m
//  TodoListApp
//
//  Created by psagc on 28/03/24.
//

#import "NSDate+Reusable.h"

@implementation NSDate(Reusable)
+(NSDate*)dateWithoutTime {
    NSDate *currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:currentDate];
    dateComponents.hour = 0;
    dateComponents.minute = 0;
    dateComponents.second = 0;
    NSDate *dateWithZeroTime = [calendar dateFromComponents:dateComponents];
    return dateWithZeroTime;
}
@end
