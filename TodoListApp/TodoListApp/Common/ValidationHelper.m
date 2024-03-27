//
//  ValidationHelper.m
//  TodoListApp
//
//  Created by psagc on 28/03/24.
//

#import "ValidationHelper.h"

@implementation ValidationHelper

+ (BOOL)isWhitespaceOrEmpty:(NSString *)string {
    // Check if the string is empty or contains only whitespace characters
    NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedString = [string stringByTrimmingCharactersInSet:whitespace];
    return [trimmedString isEqualToString:@""];
}

@end
