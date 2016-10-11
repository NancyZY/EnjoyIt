//
//  ViewController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "ViewController.h"
#import "Public.h"
#import "RecommendViewController.h"
#import "ColumnViewController.h"
#import "OnlineViewController.h"
#import "MineViewController.h"
#import "BaseNaviController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *backView = [[UIView alloc]initWithFrame:self.view.frame];
    backView.backgroundColor = [UIColor whiteColor];
    
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    self.tabBar.tintColor=TabBar_T_Color;
    
    [self initChildViewControllers];
    
}

-(void)initChildViewControllers
{
    NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:4];
    
    RecommendViewController *recommendVC = [[RecommendViewController alloc] init];
    [recommendVC.tabBarItem setTitle:@"推荐"];
    [recommendVC.tabBarItem setImage:[UIImage imageNamed:@"btn_home_normal"]];
    [recommendVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_home_selected"]];
    BaseNaviController *recommendNavC = [[BaseNaviController alloc] initWithRootViewController:recommendVC];
    [childVCArray addObject:recommendNavC];
    
    ColumnViewController *columnVC = [[ColumnViewController alloc] init];
    [columnVC.tabBarItem setTitle:@"栏目"];
    [columnVC.tabBarItem setImage:[UIImage imageNamed:@"btn_column_normal"]];
    [columnVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_column_selected"]];
    BaseNaviController *columnNavC = [[BaseNaviController alloc] initWithRootViewController:columnVC];
    [childVCArray addObject:columnNavC];
    
    
    OnlineViewController *onlineVC = [[OnlineViewController alloc] init];
    [onlineVC.tabBarItem setTitle:@"直播"];
    [onlineVC.tabBarItem setImage:[UIImage imageNamed:@"btn_live_normal"]];
    [onlineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_live_selected"]];
     BaseNaviController *onlineNavC = [[BaseNaviController alloc] initWithRootViewController:onlineVC];
    [childVCArray addObject:onlineNavC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    [mineVC.tabBarItem setTitle:@"我的"];
    [mineVC.tabBarItem setImage:[UIImage imageNamed:@"btn_user_normal"]];
    [mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"btn_user_selected"]];
    BaseNaviController *mineNavC = [[BaseNaviController alloc] initWithRootViewController:mineVC];
    [childVCArray addObject:mineNavC];
    
    [self setViewControllers:childVCArray];
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
