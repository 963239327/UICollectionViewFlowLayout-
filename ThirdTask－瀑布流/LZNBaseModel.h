//
//  LZNBaseModel.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZNBaseModel : NSObject

@property (nonatomic, readonly, copy) NSString *bmTitle;
@property (nonatomic, readonly, copy) NSString *bmIntro;
@property (nonatomic, readonly, copy) NSString *bmPtype;
@property (nonatomic, readonly, copy) NSString *bmAge;
@property (nonatomic, readonly, copy) NSString *bmIcon;

+ (instancetype)initWithDict:(NSDictionary *)dict;

@end
