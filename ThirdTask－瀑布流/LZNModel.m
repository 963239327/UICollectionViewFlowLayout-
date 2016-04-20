//
//  LZNModel.m
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNModel.h"
#import "LZNBaseModel.h"

@interface LZNModel ()
@property (nonatomic, strong, readwrite) NSMutableArray<LZNBaseModel *> *mDataSource;
@end

@implementation LZNModel

#pragma mark - init
+ (instancetype)initWithDict:(NSDictionary *)dict {
    LZNModel *aModel = [[LZNModel alloc] init];
    if (aModel) {
        aModel.mDataSource = [NSMutableArray arrayWithCapacity:5];
        NSArray *arr = dict[@"list"];
        for (NSDictionary *dic in arr) {
            LZNBaseModel *model = [LZNBaseModel initWithDict:dic];
            [aModel.mDataSource addObject:model];
        }
    }
    return aModel;
}

@end