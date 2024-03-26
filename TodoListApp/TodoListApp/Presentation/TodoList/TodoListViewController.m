//
//  TodoListViewController.m
//  TodoListApp
//
//  Created by psagc on 25/03/24.
//

#import "TodoListViewController.h"
#import "TodoListInteractor.h"
#import "TaskTableView.h"
#import "TaskCell.h"

@interface TodoListViewController ()
@property (nonatomic, strong) IBOutlet UITableView *taskTableView;
@property (nonatomic, strong) TodoListInteractor *interactor;
@property (nonatomic, strong) TaskTableView *taskTableViewDataSource;
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
    [self setupView];
    [self bindTableView];
    

}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadNewData];
}

-(void)setupView {
    [self setTitle:@"Todo"];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage systemImageNamed:@"plus.circle.fill"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(addTaskButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setFrame:CGRectMake(0, 0, 40, 40)];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    
}

- (void)addTaskButtonTapped {
    if(_createTaskBlock) {
        _createTaskBlock();
    }
}

-(void)bindTableView {
    [self.taskTableView registerNib:[UINib nibWithNibName:TaskCell.nibName bundle:nil] forCellReuseIdentifier:TaskCell.reuseIdentifier];
    [self reloadNewData];
    
    
}

-(void)reloadNewData {
    self.taskTableViewDataSource = [[TaskTableView alloc] initWithArray:[self.interactor fetchAllTask]];
    [self.taskTableView setDataSource:self.taskTableViewDataSource];
    [self.taskTableView setDelegate:self.taskTableViewDataSource];
    __weak typeof(self) weakSelf = self;
    self.taskTableViewDataSource.taskSelectedBlock = ^(TodoItem *item) {
        [weakSelf.interactor completeTask:item];
    };
}

@end
