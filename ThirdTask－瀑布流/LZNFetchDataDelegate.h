//
//  LZNFetchDataDelegate.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class LZNModel;

@protocol LZNFetchDataDelegate <NSObject>

- (void)fetchDataSuccessfullyWithModel:(LZNModel *)model;

@end
