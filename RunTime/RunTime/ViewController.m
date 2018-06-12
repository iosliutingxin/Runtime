//
//  ViewController.m
//  RunTime
//
//  Created by 李孔文 on 2018/6/11.
//  Copyright © 2018年 Sunning. All rights reserved.
//

#import "ViewController.h"
#import "person.h"
#import <objc/message.h>
#include <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

-(void)dome01{
    
    //    person * p = [[person alloc]init];
    
    //    person *p =  objc_msgSend([person class], @selector(alloc));
    //    p = objc_msgSend(p, @selector(init));
    
    person *p =  objc_msgSend(objc_getClass("person"), sel_registerName("alloc"),sel_registerName("init"));
    
    
    //1
    //[p eat];
    
    //2
    //[p performSelector:@selector(eat)];
    
    //3
    //消息发送机制---buid setting --->msg---yes
    objc_msgSend(p , @selector(eat));
}

-(void)dome02{
    
    NSURL *url = [NSURL URLWithString:@"中文.com"];
    NSLog(@"%@",url);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self dome02];
}


@end
