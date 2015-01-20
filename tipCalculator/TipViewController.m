//
//  TipViewController.m
//  tipCalculator
//
//  Created by Eduardo Aranega on 1/19/15.
//  Copyright (c) 2015 Eduardo Aranega All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()
@property (strong, nonatomic) IBOutlet UITextField *billTextField;
@property (strong, nonatomic) IBOutlet UILabel *tipLabel;
@property (strong, nonatomic) IBOutlet UILabel *totalLabel;
@property (strong, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTab:(id)sender;
- (void)updateValues;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{

    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self){
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"view will appear");
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger key = [defaults integerForKey:@"default_tip"];
    self.tipControl.selectedSegmentIndex = key;
    [self updateValues];
}

- (void)viewDidLoad {
    NSLog(@"view did load");
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    NSLog(@"view did receive memory warning ");
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"view did disappear");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void) onSettingsButton{
    
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}


- (void) updateValues{
    
    float billAmount = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(0.1), @(0.15), @(0.2)];
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
    
}

- (IBAction)onTab:(id)sender {
    
    [self.view endEditing:YES];
    [self updateValues];
    
}
@end
