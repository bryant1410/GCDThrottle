//
//  ViewController.m
//  GCDThrottle
//
//  Created by cyan on 16/5/24.
//  Copyright © 2016年 cyan. All rights reserved.
//

#import "ViewController.h"
#import "GCDThrottle.h"

@implementation ViewController

- (IBAction)textFieldValueChanged:(UITextField *)sender {
    
    dispatch_throttle_by_type(1, GCDThrottleTypeInvokeAndIgnore, ^{
        NSLog(@"%@", sender.text);
    });
}

@end
