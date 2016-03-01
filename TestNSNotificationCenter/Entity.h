//
//  Entity.h
//  TestNSNotificationCenter
//
//  Created by rongtong on 16/3/1.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Entity : NSObject

@property (nonatomic,strong)NSString *notificationName;

@property (nonatomic)id observer;
//这里还必须是assign 不能是 weak 啊？？？？
@property (nonatomic,assign) SEL aSelector;

@end
