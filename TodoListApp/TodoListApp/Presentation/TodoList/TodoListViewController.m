//
//  TodoListViewController.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TodoListViewController.h"
#import "TodoListInteractor.h"
#import "TaskTableView.h"

@interface TodoListViewController ()
@property (nonatomic, strong) IBOutlet UITableView *taskTableView;
@property (nonatomic, strong) TodoListInteractor *interactor;
@end

@implementation TodoListViewController

- (instancetype)initWithInteractor:(TodoListInteractor*)interactor {
    self = [super initWithNibName:@"TodoListViewController" bundle:nil];
    if (self) {
        _interactor = interactor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self bindTableView];
}

-(void)bindTableView {
    
    [self.taskTableView registerNib:[UINib nibWithNibName:@"TaskCell" bundle:nil] forCellReuseIdentifier:@"TaskCell"];
    TaskTableView *dataSource = [[TaskTableView alloc] initWithArray:[self.interactor fetchAllTask]];
    [self.taskTableView setDataSource:dataSource];
    [self.taskTableView reloadData];
}


@end
