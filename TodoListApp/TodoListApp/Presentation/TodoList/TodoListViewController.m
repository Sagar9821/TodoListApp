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
#import "TaskDateCell.h"
#import "TasksDatesCollectionView.h"
#import "UIView+Reusable.h"
#import "UIViewController+Reusable.h"
#import "NSDate+Reusable.h"

@interface TodoListViewController ()
@property (nonatomic, strong) IBOutlet UITableView *taskTableView;
@property (nonatomic, strong) IBOutlet UICollectionView *taskDatesCollectionView;
@property (nonatomic, strong) IBOutlet UIView *addTaskContainer;
@property (nonatomic, strong) IBOutlet UIView *imageBackgroundView;
@property (nonatomic, strong) TodoListInteractor *interactor;
@property (nonatomic, strong) TaskTableView *taskTableViewDataSource;
@property (nonatomic, strong) TasksDatesCollectionView *taskDatesCollectionViewDataSource;

@end

@implementation TodoListViewController

- (instancetype)initWithInteractor:(TodoListInteractor*)interactor {
    self = [super initWithNibName:@"TodoListViewController" bundle:nil];
    if (self) {
        _interactor = interactor;
    }    
    return self;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self bindTableView];
    [self bindCollectionView];
    [self setupView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self reloadNewData];
    
}

#pragma mark - Helper Methods
-(void)setupView {
    [self setTitle:@"Todo"];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage systemImageNamed:@"plus.circle.fill"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(addTaskButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setFrame:CGRectMake(0, 0, 40, 40)];
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [self.navigationItem setRightBarButtonItem:rightBarButtonItem];
    [self.imageBackgroundView addCornerRadius:50];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];

}

-(void)bindTableView {
    [self.taskTableView registerNib:[UINib nibWithNibName:TaskCell.nibName bundle:nil] forCellReuseIdentifier:TaskCell.reuseIdentifier];
        
    self.taskTableViewDataSource = [[TaskTableView alloc] initWithArray:[self.interactor tasksForDate:[NSDate dateWithoutTime]]];
    
    [self.taskTableView setDataSource:self.taskTableViewDataSource];
    [self.taskTableView setDelegate:self.taskTableViewDataSource];
    
    
    __weak typeof(self) weakSelf = self;
    
    self.taskTableViewDataSource.taskSelectedBlock = ^(TodoItem *item) {
        [weakSelf.interactor completeTask:item];
    };
    
    self.taskTableViewDataSource.taskDeleteBlock = ^(TodoItem *item) {
        [weakSelf.interactor deleteTask:item];
        [weakSelf reloadNewData];
    };
    
    
}

-(void)bindCollectionView {
    
    [self.taskDatesCollectionView registerNib:[UINib nibWithNibName:TaskDateCell.nibName bundle:nil]
                   forCellWithReuseIdentifier:TaskDateCell.reuseIdentifier];
        
    self.taskDatesCollectionViewDataSource = [[TasksDatesCollectionView alloc] initWithArray:[self.interactor datesForCurrentYear]];
    
    [self.taskDatesCollectionView setDataSource:self.taskDatesCollectionViewDataSource];
    [self.taskDatesCollectionView setDelegate:self.taskDatesCollectionViewDataSource];
    
    __weak typeof(self) weakSelf = self;
    self.taskDatesCollectionViewDataSource.selectedDateBlock = ^(NSDate *date) {
        [weakSelf reloadNewData];
    };
    
    [self.taskDatesCollectionViewDataSource scrollToToday:self.taskDatesCollectionView];
}

-(void)reloadNewData {
    [self.taskTableViewDataSource setArray:[self.interactor tasksForDate:[self.taskDatesCollectionViewDataSource selectedDate]]];
    [self.taskTableView reloadData];
    [self.addTaskContainer setHidden:self.taskTableViewDataSource.array.count != 0];
}

-(void)moveToCreateTask {
    if(_createTaskBlock) {
        self.createTaskBlock([self.taskDatesCollectionViewDataSource selectedDate]);
    }
}

#pragma mark - Action Methods
- (void)addTaskButtonTapped {
    [self moveToCreateTask];
}
-(IBAction)didTapOnAddTask:(id)sender {
    [self moveToCreateTask];
}



@end
