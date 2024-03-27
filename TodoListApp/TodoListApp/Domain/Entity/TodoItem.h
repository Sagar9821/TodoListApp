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
@property (nonatomic, copy) NSManagedObjectID *uniqID;
@property (nonatomic, copy) NSDate *creationDate;
@property (nonatomic, copy) NSString *taskTitle;
@property (nonatomic, copy) NSString *taskDescription;
@property (nonatomic) BOOL isTaskCompleted;
- (instancetype)initWithTitle:(NSString*)taskTitle andDescription:(NSString*)taskDescription andIsCompleted:(BOOL)isTaskCompleted andCreationDate:(NSDate*)creationDate;
-(instancetype)initWithManagedObject:(NSManagedObject*)managedObject;
@end

NS_ASSUME_NONNULL_END
