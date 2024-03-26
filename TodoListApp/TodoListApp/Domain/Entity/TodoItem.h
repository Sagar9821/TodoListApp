//
//  TodoItem.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface TodoItem : NSObject
@property (assign, nonatomic) NSManagedObjectID *uniqID;
@property (assign, nonatomic) NSString *taskTitle;
@property (assign, nonatomic) NSString *taskDescription;
@property (assign, nonatomic) BOOL isTaskCompleted;
- (instancetype)initWithTitle:(NSString*)taskTitle andDescription:(NSString*)taskDescription andIsCompleted:(BOOL)isTaskCompleted;
-(instancetype)initWithManagedObject:(NSManagedObject*)managedObject;
@end

NS_ASSUME_NONNULL_END
