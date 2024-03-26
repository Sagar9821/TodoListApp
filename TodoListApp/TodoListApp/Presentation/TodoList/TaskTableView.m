//
//  TaskTableView.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TaskTableView.h"
#import "TaskCell.h"

@interface TaskTableView ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation TaskTableView

-(instancetype)initWithArray:(NSArray *)tasks {
    self = [super init];
    if (self) {
        _array = tasks;
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    [cell configureCellWith:self.array[indexPath.row]];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TodoItem *item = [self.array objectAtIndex:indexPath.row];
    if (self.taskSelectedBlock) {
           self.taskSelectedBlock(item);
       }
}



@end
