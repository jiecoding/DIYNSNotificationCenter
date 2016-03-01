//
//  DIYNotificationSingle.h
//  TestNSNotificationCenter
//
//  Created by rongtong on 16/3/1.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIYNotificationSingle : NSObject

@property (nonatomic,strong)NSMutableArray *observers;

@property (nonatomic,strong)NSMutableDictionary *observersDic;


+ (DIYNotificationSingle *)sharedManager;


- (void)diyAddObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject;

- (void)diyPostNotificationName:(NSString *)aName object:(nullable id)anObject;

- (void)diyRemoveObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;


@end
