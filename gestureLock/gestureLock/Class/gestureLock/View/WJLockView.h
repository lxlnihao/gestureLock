//
//  WJLockView.h
//  gestureLock
//
//  Created by 刘晓龙 on 2018/6/7.
//  Copyright © 2018年 wajiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WJLockView;

@protocol WJLockViewDelegate <NSObject>

-(void)lockViewDidClick:(WJLockView*)lockView andPwd:(NSString*)pwd;
@end

@interface WJLockView : UIView

@property (nonatomic,weak) id<WJLockViewDelegate> delegate;

@end
