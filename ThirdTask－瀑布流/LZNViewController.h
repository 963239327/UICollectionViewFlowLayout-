//
//  LZNViewController.h
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNFetchDataDelegate.h"

@interface LZNViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, LZNFetchDataDelegate, UICollectionViewDelegateFlowLayout>

@end
