
//
//  LZNViewController.m
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNViewController.h"
#import "LZNViewModel.h"
#import "LZNModel.h"
#import "LZNCollectionViewCell.h"
#import "LZNBaseModel.h"
#import "LZNFlowLayout.h"
#import "LZNCollectionViewFlowLayout.h"
#import "PTHomeCollectionViewCell.h"

@interface LZNViewController ()

@property (nonatomic, strong) LZNViewModel *myViewModel;
@property (nonatomic, strong) UICollectionView *myCollectionView;
@property (nonatomic, strong) NSArray *myDataSource;

@end

@implementation LZNViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"我爱董晓宇，么么哒");
    NSLog(@"要一辈子跟你在一起～");
    self.title = @"--->";
    [self.view addSubview:self.myCollectionView];
    
    [self fetchData];
}

#pragma mark - 刷新数据相关
- (void)fetchData {
    [self.myViewModel fetchData];
}

#pragma mark - LZNFetchDataDelegate
/**
 *  网络请求成功
 *
 *  @param model 请求到的数据
 */
- (void)fetchDataSuccessfullyWithModel:(LZNModel *)model {
    NSLog(@"fetchDataSuccessfullyWithModel...");
    [self.myCollectionView.mj_header endRefreshing];
    
    if (model && [model isKindOfClass:[LZNModel class]]) {
        LZNModel *aModel = (LZNModel *)model;
        if (aModel.mDataSource.count) {
            self.myDataSource = aModel.mDataSource;
            [self.myCollectionView reloadData];
        }
    }
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    LZNBaseModel *baseModel = [self.myDataSource objectAtIndex:indexPath.row];
    
    CGSize size = CGSizeMake(UICOLLECTIONVIEWCELL_WIDTH-40, 1000.0);
    NSStringDrawingOptions options =  NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    NSDictionary *attr = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    
    CGRect tmpRect = [baseModel.bmIntro boundingRectWithSize:size
                                                            options:options
                                                         attributes:attr
                                                            context:nil];
    
    CGFloat height = UICOLLECTIONVIEWCELL_WIDTH+40+20+10+tmpRect.size.height+20+20;
    return CGSizeMake(UICOLLECTIONVIEWCELL_WIDTH, height);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.myDataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"LZNViewController cellForItemAtIndexPath...");
    LZNCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICOLLECTIONVIEWCELL_REUSE_ID forIndexPath:indexPath];
    LZNBaseModel *aBaseModel = [self.myDataSource objectAtIndex:indexPath.row];
    [cell assignmentUIWithModel:aBaseModel];
//    [cell setItem:aBaseModel forIndexPath:indexPath];
    return cell;
}

#pragma mark - UICollectionViewDelegate
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LZNCollectionViewCell *cell = (LZNCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    NSLog(@"selectCellIndex= %lu", indexPath.row);
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    LZNCollectionViewCell *cell = (LZNCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
}

#pragma mark - getter
- (LZNViewModel *)myViewModel {
    if (_myViewModel == nil) {
        _myViewModel = [[LZNViewModel alloc] init];
        _myViewModel.delegate = self;
    }
    return _myViewModel;
}

- (UICollectionView *)myCollectionView {
    if (!_myCollectionView) {
        //LZNFlowLayout *flow = [[LZNFlowLayout alloc] init];
        LZNCollectionViewFlowLayout *flow = [[LZNCollectionViewFlowLayout alloc] init];
        flow.delegate = self;
        _myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20+44, self.view.frame.size.width, self.view.frame.size.height-20) collectionViewLayout:flow];
        _myCollectionView.backgroundColor = [UIColor grayColor];
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        [_myCollectionView registerClass:[LZNCollectionViewCell class] forCellWithReuseIdentifier:UICOLLECTIONVIEWCELL_REUSE_ID];
        _myCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(fetchData)];
    }
    return _myCollectionView;
}

- (NSArray *)myDataSource {
    if (!_myDataSource) {
        _myDataSource = [[LZNModel alloc] init].mDataSource;
    }
    return _myDataSource;
}

@end

