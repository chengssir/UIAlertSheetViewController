//
//  ViewController.m
//  UIActionSheetViewController
//
//  Created by 国帅 on 2019/3/12.
//  Copyright © 2019 asi. All rights reserved.
//

#import "ViewController.h"
#import "UIAlertSheetViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)click:(id)sender {
   
    UIAlertSheetViewController *alerView = [[UIAlertSheetViewController alloc]init];
    [alerView addAction:[UIAlertSheetAction actionWithTitle:@"置顶微信号" style:UIAlertSheetActionStyleDefault handler:^(UIAlertSheetAction *action) {
        NSLog(@"你点击了 --%@",action.title);
    }]];
    [alerView addAction:[UIAlertSheetAction actionWithTitle:@"推荐" style:UIAlertSheetActionStyleDefault handler:^(UIAlertSheetAction *action) {
        NSLog(@"你点击了 --%@",action.title);
    }]];
    [alerView addAction:[UIAlertSheetAction actionWithTitle:@"关注" style:UIAlertSheetActionStyleDefault handler:^(UIAlertSheetAction *action) {
        NSLog(@"你点击了 --%@",action.title);
    }]];
    [alerView addAction:[UIAlertSheetAction actionWithTitle:@"举报" style:UIAlertSheetActionStyleDestructive handler:^(UIAlertSheetAction *action) {
        NSLog(@"你点击了 --%@",action.title);
    }]];
    
    [alerView addAction:[UIAlertSheetAction actionWithTitle:@"取消" style:UIAlertSheetActionStyleCancel handler:^(UIAlertSheetAction *action) {
        NSLog(@"你点击了 --%@",action.title);
    }]];

    [self presentViewController:alerView animated:YES completion:nil];
    
}

@end
