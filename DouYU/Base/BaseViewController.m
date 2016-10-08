//
//  BaseViewController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BaseViewController loading...");
    self.view.backgroundColor = [UIColor redColor];
    UIButton *leftButton = [UIButton  buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"Image_scan"] forState:UIControlStateNormal];
    leftButton.frame = CGRectMake(0, 0, 25, 25);
    [leftButton addTarget:self action:@selector(tappedScan) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"btn_search"] forState:UIControlStateNormal];
    rightButton.frame = CGRectMake(0, 0, 25, 25);
    [rightButton addTarget:self action:@selector(tappedSearch) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIImageView *titleView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 104, 28)];
    titleView.image = [UIImage imageNamed:@"logo"];
    self.navigationItem.titleView = titleView;
}

- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self setHidesBottomBarWhenPushed:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tappedScan{
    NSLog(@"Scan....");
}


-(void)tappedSearch{
    NSLog(@"Search....");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
