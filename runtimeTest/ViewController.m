//
//  ViewController.m
//  runtimeTest
//
//  Created by xian on 15/11/12.
//  Copyright © 2015年 xian. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "PYPerson.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self test1];
    //[self test2];
    
    objc_property_t property_t = class_getProperty ( [self class], "name" );
}

- (void)test3 {

    
}

/****************************************************************************************************************/
- (void)test2 {
    // 获取类的父类
    Class superClass = class_getSuperclass ([PYPerson class]);
    NSLog(@"PYPerson superClass:%@",superClass);
    
    // 判断给定的Class是否是一个元类
//    BOOL class_isMetaClass ( Class cls );
    self.name = @"lihua";
    Ivar varname = class_getInstanceVariable ([self class], "name");
    NSLog(@"%@",varname);
}
/********************************************************************************************************************/
//得到所有成员变量

- (void)test1 {
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([PYPerson class], &count);
    
    for (int i = 0; i<count; i++) {
        
        // 取出i位置对应的成员变量
        Ivar ivar = ivars[i];
        
        // 查看成员变量
        const char *name = ivar_getName(ivar);
        
        // 归档
        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"keyname:%@",key);
    }
    
    free(ivars);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
