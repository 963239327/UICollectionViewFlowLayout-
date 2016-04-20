//
//  LZNViewModel.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LZNFetchDataDelegate.h"

@interface LZNViewModel : NSObject

@property (nonatomic, assign) id<LZNFetchDataDelegate> delegate;

/**
 *  获取数据
 */
- (void)fetchData;

@end
