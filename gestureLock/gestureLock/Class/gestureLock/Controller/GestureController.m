//
//  GestureController.m
//  gestureLock
//
//  Created by 刘晓龙 on 2018/6/7.
//  Copyright © 2018年 wajiu. All rights reserved.
//

#import "GestureController.h"
#import "WJLockView.h"
@interface GestureController ()<WJLockViewDelegate>

@end

@implementation GestureController

- (void)viewDidLoad {
    [super viewDidLoad];

    WJLockView* lockView = [[WJLockView alloc]initWithFrame:CGRectMake(0, 20, wj_width, wj_height)];
    lockView.delegate = self;
    [self.view addSubview:lockView];
}
-(void)lockViewDidClick:(WJLockView *)lockView andPwd:(NSString *)pwd{
    NSLog(@"pwd:%@",pwd);
}


@end
