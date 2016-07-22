//
//  ViewController.m
//  TestEveryProject
//
//  Created by shawnfeng on 16/6/27.
//  Copyright © 2016年 shawnfeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"csv" ofType:@"csv"];
    NSString *contents = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSArray *contentsArray = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    NSString *docs = [NSHomeDirectory() stringByAppendingPathComponent:@"testcsv.plist"] ;
    NSLog(@" docs == %@ ",docs);
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSInteger idx;
    //  从一开始 就不要 题头了
    for (idx = 1; idx < contentsArray.count; idx++) {
        NSString* currentContent = [contentsArray objectAtIndex:idx];
        NSArray* timeDataArr = [currentContent componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setObject:[timeDataArr objectAtIndex:0] forKey:@"id"];
        [dic setObject:[timeDataArr objectAtIndex:1] forKey:@"name"];
        [dic setObject:[timeDataArr objectAtIndex:2] forKey:@"age"];
        [arr addObject:dic];
    }
    [arr writeToFile:docs atomically:YES];
    
    
    
    
//    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
//    NSString* thepath = [paths lastObject];
//    thepath = [thepath stringByAppendingPathComponent:@"testcsv.plist"];
//    NSLog(@"桌面目录：%@", thepath);
////    NSFileManager* fm = [NSFileManager defaultManager];
////    NSData* data = [[NSData alloc] init];
////    data = [fm contentsAtPath:thepath];
//    
//    NSMutableArray *newarr = [[NSMutableArray  alloc]initWithContentsOfFile:thepath];
//    NSLog(@"  newarr == %@ ",newarr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
