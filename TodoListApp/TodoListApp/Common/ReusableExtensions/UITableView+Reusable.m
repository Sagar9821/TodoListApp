//
//  UITableView+Reusable.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "UITableView+Reusable.h"

@implementation UITableView (Reusable)

-(void)registerCell:(Class<ReusableViewProtocol>) type
{
    [self registerClass:type forCellReuseIdentifier:[type defaultReuseIdentifier]];
}

-(void)registerCellNib:(Class<NibLoadableViewProtocol,ReusableViewProtocol>) type
{
    NSBundle *bundle = [NSBundle mainBundle];
    UINib *nib = [UINib nibWithNibName:[type nibName]
                                bundle:bundle];
    [self registerNib:nib forCellReuseIdentifier:[type defaultReuseIdentifier]];
}

@end
