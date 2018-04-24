//
//  ViewController.m
//  SafeData
//
//  Created by uxin-lishiping on 16/12/29.
//  Copyright © 2016年 lishiping. All rights reserved.
//

#import "ViewController.h"

#import "SPSafeData.h"
#import "NSObject+SPArraySafe.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr= [[NSArray alloc] init];
    
//   arr =  [arr sp_arrayAddObject:@"wo"];
    
    
    
    NSLog(@"%@",SP_IS_KIND_OF(arr, NSMutableArray)?@"y":@"N");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
