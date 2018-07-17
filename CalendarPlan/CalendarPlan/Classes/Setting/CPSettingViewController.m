//
//  CPSettingViewController.m
//  CalendarPlan
//
//  Created by lmg on 2018/7/17.
//  Copyright © 2018年 lmg. All rights reserved.
//

#import "CPSettingViewController.h"
#import "CPSetTableViewCell.h"

@interface CPSettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataList;
@property (nonatomic,strong) NSArray *detailDataList;
@end

@implementation CPSettingViewController

static NSString *const cellID = @"identifier";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
    self.dataList = @[@"版本",@"内存清理",@"绑定银行卡",@"设置花销",@"设置健康"];
    self.detailDataList = @[[self getAppVersion],[self getSize],@"",@"",@""];
    [self.view addSubview:self.tableView];
}
- (NSString *)getAppVersion
{
    NSString * version = [@"V" stringByAppendingString:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    return version;
}
- (NSString *)getSize {
    __block NSUInteger size = 0;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSDirectoryEnumerator *fileEnumerator = [[NSFileManager defaultManager] enumeratorAtPath:PATH_OF_Cache];
        for (NSString *fileName in fileEnumerator) {
            NSString *filePath = [PATH_OF_Cache stringByAppendingPathComponent:fileName];
            NSDictionary<NSString *, id> *attrs = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil];
            size += [attrs fileSize];
        }
    });
    NSString *fileSize = [NSString stringWithFormat:@"%fM",size/1024.0];
    return fileSize;
}
#pragma Mark -UITableViewDelegate,UITableViewDataSource
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavBarHeight, LSWIDTH, LSHEIGHT-NavBarHeight)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 48;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CPSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[CPSetTableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    NSString *detailText = self.detailDataList[indexPath.row];
    if (detailText.length > 0) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.dataList[indexPath.row];
    cell.detailTextLabel.text = self.detailDataList[indexPath.row];
    return cell;
}
@end
