//
//  LZNCollectionViewFlowLayout.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/21.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZNCollectionViewFlowLayout : UICollectionViewLayout

@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;
@property (nonatomic, assign) NSUInteger            cellCount;  // cell 的个数
@property (nonatomic, strong) NSMutableArray        *cellHeightArray;
@property (nonatomic, strong) NSMutableDictionary   *cellAttributeDict; // cell 的位置信息
/**
 *  @author Paul Wang, 16-03-10 20:03:19
 *
 *  @brief 构造方法，用于特殊高度的 headerView
 *
 *  @param topHeight 顶高度
 *
 *  @return
 */
- (instancetype)initWithTopHeight:(CGFloat)topHeight;

@end
