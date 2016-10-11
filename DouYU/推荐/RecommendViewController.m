//
//  RecommendViewController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "RecommendViewController.h"
#import "SDCycleScrollView.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "URL.h"
#import "TOPdata.h"
#import "NSString+Times.h"

@interface RecommendViewController ()<SDCycleScrollViewDelegate>{
    SDCycleScrollView *_headView;
    
    NSMutableArray *_topDataArray;
    NSMutableArray *_imageArray;
    NSMutableArray *_titleArray;
    
}

@end

@implementation RecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self loadTopData];
    
    [self showHeadView];
    
    _topDataArray=[NSMutableArray array];
    _imageArray=[NSMutableArray array];
    _titleArray=[NSMutableArray array];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadTopData{
    NSDictionary *parameteiDic=@{@"aid":@"ios",@"auth":@"97d9e4d3e9dfab80321d11df5777a107",@"client_sys":@"ios",@"time":[NSString GetNowTimes]};
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:TOP_URl parameters:parameteiDic success:^(NSURLSessionDataTask *task, id responseObject) {
        _topDataArray=[TOPdata mj_objectArrayWithKeyValuesArray:[responseObject objectForKey:@"data"]];
        
        for(TOPdata *data in _topDataArray){
            [_imageArray addObject:data.pic_url];
            [_titleArray addObject:data.title];
        }
        _headView.imageURLStringsGroup=_imageArray;
        _headView.titlesGroup=_titleArray;
    }failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"加载失败");
    }];
}

-(void)showHeadView{
    NSLog(@"加载长度 %lu", [_imageArray count]);
    _headView=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, screenWidth, 200*KWidth_Scale) imageURLStringsGroup:_imageArray];
    _headView.placeholderImage=[UIImage imageNamed:@"Img_default"];
    _headView.delegate=self;
    _headView.pageControlStyle=SDCycleScrollViewPageContolStyleClassic;
    _headView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    _headView.titleLabelTextFont=[UIFont systemFontOfSize:17];
      [self.view addSubview:_headView];
}


// pragma mark - SDCycleScrollView

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
    TOPdata *topdata=_topDataArray[index];
    
    //PlayerController *playVC=[[PlayerController alloc]init];
    
    NSLog(@"%@",[topdata.room objectForKey:@"hls_url"]);
    
    //playVC.Hls_url=[topdata.room objectForKey:@"hls_url"];
    
   // [self setHidesBottomBarWhenPushed:YES];
    // [self presentViewController:playVC animated:YES completion:nil];
    
    
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
