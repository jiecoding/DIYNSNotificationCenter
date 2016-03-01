//
//  DIYNotificationSingle.m
//  TestNSNotificationCenter
//
//  Created by rongtong on 16/3/1.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "DIYNotificationSingle.h"
#import "Entity.h"

@implementation DIYNotificationSingle

+ (DIYNotificationSingle *)sharedManager
{
    /* 考虑线程安全的写法 
     void dispatch_once( dispatch_once_t *predicate, dispatch_block_t block);
 该函数接收一个dispatch_once用于检查该代码块是否已经被调度的谓词（是一个长整型，实际上作为BOOL使用）。它还接收一个希望在应用的生命周期内仅被调度一次的代码块，对于本例就用于shared实例的实例化。
     dispatch_once不仅意味着代码仅会被运行一次，而且还是线程安全的，这就意味着你不需要使用诸如@synchronized之类的来防止使用多个线程或者队列时不同步的问题。

     */
    static DIYNotificationSingle *ManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        ManagerInstance = [[self alloc] init];
     });
    return ManagerInstance;
}

- (void)diyAddObserver:(id)observer selector:(SEL)aSelector name:(nullable NSString *)aName object:(nullable id)anObject
{
      Entity *entity = [[Entity alloc] init];
      entity.observer = observer;
      entity.aSelector = aSelector;
      entity.notificationName = aName;
        if(!_observers)
        {
            _observers = [[NSMutableArray alloc] init];
            _observersDic = [[NSMutableDictionary alloc] init];
            
        }
    
      [_observers addObject:entity];
    
 
    //Objective-C中一种消息处理方法performSelector: withObject:  http://www.cnblogs.com/buro79xxd/archive/2012/04/10/2440074.html
//    [self performSelector:aSelector withObject:anObject];
}

- (void)diyPostNotificationName:(NSString *)aName object:(nullable id)anObject
{
    for (Entity *observer in _observers)
    {
        /*
         Objective-C中一种消息处理方法performSelector: withObject:
         
         Objective-C中调用函数的方法是“消息传递”，这个和普通的函数调用的区别是，你可以随时对一个对象传递任何消息，而不需要在编译的时候声明这些方法。所以Objective-C可以在runtime的时候传递人和消息。
         */
        [observer.observer performSelector:observer.aSelector withObject:nil];
        
       NSLog(@"add:%@",_observers);
        
    }
    
    
}

- (void)diyRemoveObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject
{
    for (int i = 0; i < _observers.count ; i++){
        Entity *observerE = [_observers objectAtIndex:i];
        if([observerE.observer isEqual:observer]){
            [_observers removeObjectAtIndex:i];
        }
    
    }
    NSLog(@"remove:%@",_observers);

}


@end
