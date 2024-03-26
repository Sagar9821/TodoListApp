//
//  CreateTaskViewController.m
//  TodoListApp
//
//  Created by psagc on 26/03/24.
//

#import "CreateTaskViewController.h"
#import "CustomTextField.h"
#import "AppColors.h"

@interface CreateTaskViewController ()
@property (nonatomic, weak) IBOutlet CustomTextField *taskTitleTextField;
@property (nonatomic, strong) IBOutlet UITextView *taskDescriptionTextView;
@property (nonatomic, strong) CreateTaskInteractor *interactor;

@end

@implementation CreateTaskViewController


- (instancetype)initWithInteractor:(CreateTaskInteractor*)interactor {
    self = [super initWithNibName:@"CreateTaskViewController" bundle:nil];
    if (self) {
        _interactor = interactor;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}
-(void)setupView {
    [self setTitle:@"Create task"];
    [self.taskTitleTextField setDelegate:self];
    self.taskTitleTextField.layer.borderWidth = 1.5;
    self.taskTitleTextField.layer.borderColor = [UIColor backgroundWhite].CGColor;
    self.taskTitleTextField.textInsets = UIEdgeInsetsMake(16.0, 16.0, 16.0, 16.0);

    [self.taskDescriptionTextView setDelegate:self];
    self.taskDescriptionTextView.layer.borderWidth = 1.5;
    self.taskDescriptionTextView.layer.borderColor = [UIColor backgroundWhite].CGColor;
    self.taskDescriptionTextView.textContainerInset = UIEdgeInsetsMake(16.0, 16.0, 16.0, 16.0);
    
    [[[self navigationController] navigationBar] setPrefersLargeTitles:FALSE];
}
#pragma mark Action Methods
-(IBAction)didTapOnSave:(UIButton*)sender {
    [self.interactor addTodoItemWithTitle:self.taskTitleTextField.text andDescription:self.taskDescriptionTextView.text];
    if(self.saveTaskBlock) {
        self.saveTaskBlock();
    }
}
#pragma mark TextField Delegates
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor midBlue].CGColor;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    textField.layer.borderColor = [UIColor backgroundWhite].CGColor;
}

#pragma mark TextView Delegates
-(void)textViewDidBeginEditing:(UITextView *)textView {
    textView.layer.borderColor = [UIColor midBlue].CGColor;
}

-(void)textViewDidEndEditing:(UITextView *)textView {
    textView.layer.borderColor = [UIColor backgroundWhite].CGColor;
}
@end
