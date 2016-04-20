//
//  LZNCollectionViewCell.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LZNBaseModel;

@interface LZNCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong, readonly) UIImageView *iconImageView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UILabel *introLabel;
@property (nonatomic, strong, readonly) UILabel *ptypeAndAgeLabel;

/**
 *  根据数据源中的数据对自定义cell里的控件进行赋值
 *
 *  @param model 数据源
 */
- (void)assignmentUIWithModel:(LZNBaseModel *)model;

@end
