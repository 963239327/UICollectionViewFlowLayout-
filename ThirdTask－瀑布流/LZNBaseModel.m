//
//  LZNBaseModel.m
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNBaseModel.h"

@interface LZNBaseModel ()
@property (nonatomic, copy, readwrite) NSString *bmTitle;
@property (nonatomic, copy, readwrite) NSString *bmIntro;
@property (nonatomic, copy, readwrite) NSString *bmPtype;
@property (nonatomic, copy, readwrite) NSString *bmAge;
@property (nonatomic, copy, readwrite) NSString *bmIcon;
@end

@implementation LZNBaseModel

#pragma mark - init
+ (instancetype)initWithDict:(NSDictionary *)dict {
    LZNBaseModel *aBaseModel = [[LZNBaseModel alloc] init];
    if (aBaseModel) {
        aBaseModel.bmTitle = dict[@"title"];
        aBaseModel.bmIntro = dict[@"intro"];
        aBaseModel.bmPtype = dict[@"ptype"];
        aBaseModel.bmAge = dict[@"age"];
        aBaseModel.bmIcon = dict[@"icon"];
    }
    return aBaseModel;
}

@end
