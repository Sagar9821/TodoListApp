//
//  TodoItem.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TodoItem.h"
#import "TodoListApp-Swift.h"

@implementation TodoItem
- (instancetype)initWithTitle:(NSString*)taskTitle andDescription:(NSString*)taskDescription andIsCompleted:(BOOL)isTaskCompleted andCreationDate:(NSDate*)creationDate{
    self = [self init];
    if (self) {        
        _taskTitle = taskTitle;
        _taskDescription = taskDescription;
        _isTaskCompleted = isTaskCompleted;
        _creationDate = creationDate;
    }
    return self;
}
-(instancetype)initWithManagedObject:(TasksMO*)managedObject {
    self = [super init];
    if(self) {
        _uniqID = managedObject.objectID;
        _taskTitle = managedObject.taskTitle;
        _taskDescription = managedObject.taskDescription;
        _isTaskCompleted = managedObject.isCompleted;
        _creationDate = managedObject.createdAt;
    }
    return  self;
}

@end
