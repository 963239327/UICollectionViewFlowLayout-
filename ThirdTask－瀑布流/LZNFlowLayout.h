//
//  LZNFlowLayout.h
//  LZNFlowLayout
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZNFlowLayout : UICollectionViewLayout

/** 列间距 */
@property (nonatomic, assign) CGFloat colMargin;
/** 行间距 */
@property (nonatomic, assign) CGFloat rowMargin;
/** 列数 */
@property (nonatomic, assign) NSInteger colCount;
/** 四周距离 */
@property (nonatomic, assign) UIEdgeInsets sectionInset;

/** 代理 */
@property (nonatomic, assign) id<UICollectionViewDelegateFlowLayout> delegate;

@end
