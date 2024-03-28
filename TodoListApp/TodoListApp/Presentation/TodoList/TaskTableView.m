//
//  TaskTableView.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TaskTableView.h"
#import "TaskCell.h"
#import "AppColors.h"

@interface TaskTableView ()
@end

@implementation TaskTableView

-(instancetype)initWithArray:(NSMutableArray *)tasks {
    self = [super init];
    if (self) {
        _array = tasks;
    }
    return self;
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
        return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:TaskCell.reuseIdentifier forIndexPath:indexPath];
    TodoItem *item = self.array[indexPath.row];
    [cell configureCellWith:item];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

#pragma mark - UITableViewDelegates

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoItem *item = [self.array objectAtIndex:indexPath.row];
    if(!item.isTaskCompleted) {
        [[self.array objectAtIndex:indexPath.row] setIsTaskCompleted:TRUE];
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        if(self.taskSelectedBlock) {
            self.taskSelectedBlock(item);
        }
    }
    
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        if(self.taskDeleteBlock) {
            
            TodoItem *item = [self.array objectAtIndex:indexPath.row];
            
            [self.array removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            self.taskDeleteBlock(item);
            
        }
    }
}

@end
