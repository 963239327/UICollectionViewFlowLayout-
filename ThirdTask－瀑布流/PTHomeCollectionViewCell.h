//
//  PTHomeCollectionViewCell.h
//  kidsPlay
//
//  Created by Paul Wang on 16/1/15.
//  Copyright © 2016年 Paul Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNBaseModel.h"

static NSString * const PTHomeVCCellIdentifier          = @"PTHomeVCCellIdentifier";    //复用标示

@interface PTHomeCollectionViewCell : UICollectionViewCell

- (void)setItem:(LZNBaseModel *)model forIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)heightForItem;

@end
