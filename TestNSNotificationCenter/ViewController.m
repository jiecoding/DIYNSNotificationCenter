//
//  ViewController.m
//  TestNSNotificationCenter
//
//  Created by rongtong on 16/3/1.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "ViewController.h"
#import "DIYNotificationSingle.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    SEL slee  = @selector(notificationSelector2);
//    [self performSelector:slee withObject:nil];
    
    [[DIYNotificationSingle sharedManager]diyAddObserver:self selector:@selector(notificationSelector2) name:@"DIYNotificationName" object:nil];
    
    
    [[DIYNotificationSingle sharedManager]diyAddObserver:self selector:@selector(notificationSelector) name:@"DIYNotificationName" object:nil];
    [[DIYNotificationSingle sharedManager] diyPostNotificationName:@"DIYNotificationName" object:nil];
   
    [[DIYNotificationSingle sharedManager] diyRemoveObserver:self name:nil object:nil];
   
}

- (void)notificationSelector2
{
    NSLog(@"notificationSelector2");
}
//
- (void)notificationSelector
{
    NSLog(@"notificationSelector");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
