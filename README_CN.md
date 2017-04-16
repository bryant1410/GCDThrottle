# GCDThrottle
![Language](https://img.shields.io/badge/language-objc-orange.svg)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

轻量的 GCD 封装，用于过滤太过频繁的方法调用

# 目的
使用一个时间阈值来限制方法调用频率，可以用在搜索时候的文本变化过滤

# 用法

```objc
# import "ViewController.h"
# import "GCDThrottle.h"

@implementation ViewController

- (IBAction)textFieldValueChanged:(UITextField *)sender {
    
    dispatch_throttle(0.3, ^{
        NSLog(@"search: %@", sender.text);
    });
    
    dispatch_throttle_on_queue(0.3, THROTTLE_GLOBAL_QUEUE, ^{
        NSLog(@"search: %@", sender.text);
    });
    
    [GCDThrottle throttle:0.3 block:^{
        NSLog(@"search: %@", sender.text);
    }];
    
    [GCDThrottle throttle:0.3 queue:THROTTLE_GLOBAL_QUEUE block:^{
        NSLog(@"search: %@", sender.text);
    }];
}

@end
```

# 以上
