//
//  ColumnViewController.m
//  DouYU
//
//  Created by Nancy's MacbookPro on 29/09/2016.
//  Copyright © 2016 Nancy's MacbookPro. All rights reserved.
//

#import "ColumnViewController.h"
#import "Public.h"
#import "AFNetworking.h"
#import "ColumnModel.h"
#import "CollectionViewCell.h"

 NSString *cellIdentifier = @"CollectionViewCell";

#define URL @"http://www.douyutv.com/api/v1/game?aid=ios&auth=3f252c3294b31a61fbdd890a45609549&client_sys=ios&time=1446450360"

@interface ColumnViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>{

    UICollectionView *_collectionView;
    NSMutableArray *_dataArray;
    
}

@end

@implementation ColumnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view = [[UIView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    
    [self initCollectionView];
    [self loadData];
}

-(void)initCollectionView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(200, 200);
    layout.sectionInset = UIEdgeInsetsMake(60, 20, 0, 20);
    layout.minimumInteritemSpacing=10;
    layout.minimumLineSpacing=20;
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout: layout];
    
//    [_collectionView registerNib:cellNib forCellWithReuseIdentifier:cellIdentifier];
    
    [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
//    _collectionView.backgroundColor=RGBA(200, 200, 200, 0.25);
    _collectionView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:_collectionView];
}

-(void)loadData{
    // 启动系统风火轮
     [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:URL parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//        _dataArray = [ColumnModel objectArrayWithKeyValuesArray:[responseObject objectForKey:@"data"]];
        _dataArray = [[NSMutableArray alloc]init];
        NSDictionary *resultDict = [responseObject objectForKey:@"data"];
        for(NSDictionary *columnDict in resultDict){
            ColumnModel *newColumn = [[ColumnModel alloc] initWithDictionary:columnDict];
                NSLog(@"数组长度为%@",newColumn.game_name);
            [_dataArray addObject:newColumn];
        }
        
        [_collectionView reloadData];
        
        // 隐藏系统风火轮
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"失败%@",error.userInfo);
        // 解析失败隐藏系统风火轮
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Collection View Delegates

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_dataArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
     CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    [cell setContentWith:_dataArray[indexPath.item]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showPhotoDetail" sender:self];
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
