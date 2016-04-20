//
//  LZNFlowLayout.m
//  LZNFlowLayout
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNFlowLayout.h"

@interface LZNFlowLayout ()
/** 存储每一列最大的Y */
@property (nonatomic, strong) NSMutableDictionary *maxYDict;
/** 存储所有布局属性 */
@property (nonatomic, strong) NSMutableArray *attrsArray;
@end

@implementation LZNFlowLayout

- (instancetype)init {
    if (self = [super init]) {
        self.colCount = 2;
        self.colMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        _attrsArray = [NSMutableArray array];
    }
    return self;
}

/**
 *  每次重新布局都要掉用这个方法，所以要清空，重新计算
 */
- (void)prepareLayout {
    NSLog(@"LZNFlowLayout prepareLayout...");
    [super prepareLayout];
    
    /** 1.清空最大的Y值，都设置成top */
    for (int i = 0; i < self.colCount; i++) {
        NSString *column = [NSString stringWithFormat:@"%i", i];
        self.maxYDict[column] = @(self.sectionInset.top);
    }
    
    /** 2.计算所有cell的属性加到数组中 */
    [self.attrsArray removeAllObjects];
    NSInteger cnt = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < cnt; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attrsArray addObject:attrs];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"LZNFlowLayout layoutAttributesForItemAtIndexPath...");
    /** 寻找出最短的一列 */
    __block NSString *minColumn = @"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] < [self.maxYDict[minColumn] floatValue]) {
            minColumn = column;
        }
    }];
    
    /** 通过协议获得cell的尺寸 */
    CGSize itemSize = [self.delegate collectionView:self.collectionView layout:self sizeForItemAtIndexPath:indexPath];
    
    /** 计算位置 */
    CGFloat x = self.sectionInset.left + (itemSize.width + self.colMargin)*[minColumn integerValue];
    CGFloat y = [self.maxYDict[minColumn] floatValue] + self.rowMargin;
    
    /** 更新最大的Y值 */
    self.maxYDict[minColumn] = @(y+itemSize.height);
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, itemSize.width, itemSize.height);
    return attrs;
}

#pragma mark 返回cell的布局信息
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attrsArray;
}

- (CGSize)collectionViewContentSize {
    NSLog(@"LZNFlowLayout collectionViewContentSize...");
    
    /** 寻找出最长的一列 */
    __block NSString *maxColumn = @"0";
    [self.maxYDict enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {
        if ([maxY floatValue] > [self.maxYDict[maxColumn] floatValue]) {
            maxColumn = column;
        }
    }];
    
    /** 计算得出最大的Y值 */
    return CGSizeMake(0, [self.maxYDict[maxColumn] floatValue] + self.sectionInset.bottom);
}

/**
 *  只要布局重新计算就刷新layout里面的attributes
 */
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

- (NSMutableArray *)attrsArray {
    if (!_attrsArray) {
        _attrsArray = [NSMutableArray arrayWithCapacity:5];
    }
    return _attrsArray;
}

- (NSMutableDictionary *)maxYDict {
    if (!_maxYDict) {
        _maxYDict = [NSMutableDictionary dictionaryWithCapacity:5];
    }
    return _maxYDict;
}

@end
