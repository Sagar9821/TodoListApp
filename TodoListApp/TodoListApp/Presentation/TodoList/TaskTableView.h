//
//  TaskTableView.h
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

@import UIKit;

@interface TaskTableView :  NSObject <UITableViewDataSource>
- (instancetype)initWithArray:(NSArray *)tasks;
@end


