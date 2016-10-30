//
//  ViewController.m
//  课堂任务1
//
//  Created by Adam on 2016/10/30.
//  Copyright © 2016年 YinY. All rights reserved.
//

#import "ViewController.h"
#import "AYAddition.h"
#import "TestTableViewCell.h"
#import "AFNTestModel.h"
#import "AFNetworking.h"
#import "UIImageView+WebCache.h"


static NSString * CellID = @"CellID";

@interface ViewController ()<UITableViewDataSource>
@end

@implementation ViewController{
    UITableView *_tableView;
    NSArray<AFNTestModel *> *_dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self setupUI];
}

- (void)loadData{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://raw.githubusercontent.com/yinad/zlhstiaox/master/apps.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray * muArray = [NSMutableArray array];
        [responseObject enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            AFNTestModel * model = [AFNTestModel AFNTestModelWithDict:obj];
            [muArray addObject:model];
        }];
        _dataArray = muArray.copy;
        [_tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

- (void)setupUI{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor lightGrayColor];
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    _tableView.rowHeight = 80;
    [_tableView registerNib:[UINib nibWithNibName:@"TestTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:CellID];
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TestTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    cell.nameLabel.text = _dataArray[indexPath.row].name;
    cell.downloadLabel.text = _dataArray[indexPath.row].download;
    [cell.iconImageView sd_setImageWithURL:[NSURL URLWithString:_dataArray[indexPath.row].icon] placeholderImage:[UIImage imageNamed:@"user_default@2x"]];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
