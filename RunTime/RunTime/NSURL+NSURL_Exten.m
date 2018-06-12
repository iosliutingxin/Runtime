//
//  NSURL+NSURL_Exten.m
//  RunTime
//
//  Created by 李孔文 on 2018/6/12.
//  Copyright © 2018年 Sunning. All rights reserved.
//

#import "NSURL+NSURL_Exten.h"
#import <objc/message.h>

@implementation NSURL (NSURL_Exten)

//自定义方法的实现
+(instancetype)AXURLWithString:(NSString *)URLString{
    
    NSURL *url = [self AXURLWithString:URLString];
    
    if (!url) {
        NSLog(@"url为空");
    }
    return url;
}
//加载---最早进入--做方法欺骗
+(void)load{
    
    //拿到method
    Method URLWithString = class_getClassMethod([NSURL class], @selector(URLWithString:));
    Method AXURLWithString = class_getClassMethod([NSURL class], @selector(AXURLWithString:));

    //交换
    method_exchangeImplementations(URLWithString, AXURLWithString);
    
}
@end
