//
//  MineViewController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "MineViewController.h"
#import "Public.h"
#import "CustomCell.h"

@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
    
    NSArray *_dataArray;
}

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@[@"Image_focus.png",@"我的关注"],@[@"Image_history.png",@"观看历史"],@[@"Image_remind.png",@"开播提醒"],
    @[@"Image_set.png",@"系统设置"],@[@"Image_recommend.png",@"精彩推荐"]];
    
    [self initTableView];
}


-(void)initTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, screenHeight) style:UITableViewStyleGrouped];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section ==1){
        return 5;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        return 85*KWidth_Scale;
    }
    return 50*KWidth_Scale;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35*KWidth_Scale;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        CustomCell *firstCell = [CustomCell GetCellWithTableView:tableView];
        return firstCell;        
    }else if (indexPath.section == 1){
        static NSString *secondCell = @"wCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:secondCell];
        if(!cell){
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:secondCell];
        }
        
        NSArray *array = _dataArray[indexPath.row];
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text = array[1];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if(indexPath.section == 2){
        static NSString *thirdCell = @"3cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:thirdCell];
        if(!cell){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:thirdCell];
        }
        NSArray *array = _dataArray.lastObject;
        cell.imageView.image = [UIImage imageNamed:array[0]];
        cell.textLabel.text = array[1];
        cell.detailTextLabel.text = @"更多鱼丸等你来拿";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        //avatar clicked
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
                NSLog(@"click row number is %ld",indexPath.row);
                break;
            case 1:
                NSLog(@"click row number is %ld",indexPath.row);
                break;
            case 2:
                NSLog(@"click row number is %ld",indexPath.row);
                break;
            case 3:
                NSLog(@"click row number is %ld",indexPath.row);
                break;
            default:
                break;
        }
    }else if (indexPath.section ==2){
        // click second section
    }
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

@end
