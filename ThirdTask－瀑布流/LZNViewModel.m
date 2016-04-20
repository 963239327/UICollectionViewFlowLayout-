//
//  LZNViewModel.m
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNViewModel.h"
#import "LZNModel.h"

@implementation LZNViewModel

/**
 *  抓取数据
 */
- (void)fetchData {
    NSLog(@"fetchData...");
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://api2.kids.zhuiapp.com/product/product/recommend?version=220&platform=1&offset=0";
    
    [manager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        //NSLog(@"%@", downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"获取数据成功...");
        //NSLog(@"responseObject= %@", responseObject);
        
        // 解析抓取到的JSON数据
        NSDictionary *dic = responseObject[@"data"];
        
        // 把抓取到的数据传给model
        LZNModel *model = [LZNModel initWithDict:dic];

        // 通知viewController抓取成功
        [self.delegate fetchDataSuccessfullyWithModel:model];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
