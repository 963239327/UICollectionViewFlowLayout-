//
//  LZNBaseModel.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LZNBaseModel : NSObject

@property (nonatomic, copy, readonly) NSString *bmTitle;
@property (nonatomic, copy, readonly) NSString *bmIntro;
@property (nonatomic, copy, readonly) NSString *bmPtype;
@property (nonatomic, copy, readonly) NSString *bmAge;
@property (nonatomic, copy, readonly) NSString *bmIcon;

+ (instancetype)initWithDict:(NSDictionary *)dict;

@end
