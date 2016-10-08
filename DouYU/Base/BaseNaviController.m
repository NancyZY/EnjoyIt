//
//  BaseNaviController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 08/10/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "BaseNaviController.h"
#import "Public.h"


@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.barTintColor=TabBar_T_Color;
    self.navigationBar.tintColor=[UIColor whiteColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
