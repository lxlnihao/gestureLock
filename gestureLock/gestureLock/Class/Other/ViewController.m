//
//  ViewController.m
//  gestureLock
//
//  Created by 刘晓龙 on 2018/6/7.
//  Copyright © 2018年 wajiu. All rights reserved.
//

#import "ViewController.h"
#import "GestureController.h"
#import "CameraController.h"

#define wj_width [UIScreen mainScreen].bounds.size.width
#define wj_height [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSArray* dataArr;
@end

@implementation ViewController

-(UITableView *)tableView{
    if (_tableView==nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, wj_width, wj_height)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"项目列表";
    
    self.dataArr = @[@"手势解锁",@"自定义相机"];
    [self.view addSubview:self.tableView];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* cellId = @"cellId";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@",indexPath.row,self.dataArr[indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row==0) {//手势解锁
        GestureController* gesture = [[GestureController alloc]init];
        [self.navigationController pushViewController:gesture animated:YES];
    }else if (indexPath.row==1){
        CameraController* camera = [[CameraController alloc]init];
        [self.navigationController presentViewController:camera animated:YES completion:nil];
    }
}

@end
