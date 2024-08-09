//
//  TIHomeViewController.m
//  TIRedux
//
//  Created by 段连洁 on 2024/8/9.
//  Copyright © 2024 todayios. All rights reserved.
//

#import "TIHomeViewController.h"
#import "TIReduxViewController.h"

@interface TIHomeViewController ()

@end

@implementation TIHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)openReduxPage:(UIButton *)sender {
    TIReduxViewController *page = [[TIReduxViewController alloc] init];
    [self.navigationController pushViewController:page animated:YES];
}

@end
