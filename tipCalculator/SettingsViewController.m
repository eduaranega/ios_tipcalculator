//
//  SettingsViewController.m
//  tipCalculator
//
//  Created by Eduardo Aranega on 1/19/15.
//  Copyright (c) 2015 Eduardo Aranega All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *defaultTipSegmentIndex;
- (IBAction)onDefaultChange:(id)sender;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    // Do any additional setup after loading the view from its nib.
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger key = [defaults integerForKey:@"default_tip"];
    self.defaultTipSegmentIndex.selectedSegmentIndex = key;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onDefaultChange:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSInteger v = self.defaultTipSegmentIndex.selectedSegmentIndex;
    [defaults setInteger:v forKey:@"default_tip"];
    [defaults synchronize];
}
@end
