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
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaskCell"];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

@end
