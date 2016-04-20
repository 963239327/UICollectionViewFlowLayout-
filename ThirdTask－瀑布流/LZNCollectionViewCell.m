//
//  LZNCollectionViewCell.m
//  ThirdTask－瀑布流
//
//  Created by linzhennan on 16/3/18.
//  Copyright © 2016年 Zhennan Lin. All rights reserved.
//

#import "LZNCollectionViewCell.h"
#import "LZNBaseModel.h"

#define WIDTH UICOLLECTIONVIEWCELL_WIDTH

@interface LZNCollectionViewCell ()
@property (nonatomic, strong, readwrite) UIImageView *iconImageView;
@property (nonatomic, strong, readwrite) UILabel *titleLabel;
@property (nonatomic, strong, readwrite) UILabel *introLabel;
@property (nonatomic, strong, readwrite) UILabel *ptypeAndAgeLabel;
@end

@implementation LZNCollectionViewCell

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.introLabel];
        [self.contentView addSubview:self.ptypeAndAgeLabel];
    }
    return self;
}

- (void)layoutSubviews {
    NSLog(@"LZNCollectionViewCell layoutSubViews...");
    [super layoutSubviews];
    
    self.introLabel.frame = CGRectMake(20, WIDTH+40+20+10, WIDTH-40, 0);
    [self.introLabel sizeToFit];
    
    self.ptypeAndAgeLabel.frame = CGRectMake(20, WIDTH+40+20+10+self.introLabel.frame.size.height+10, WIDTH-40, 20);
}

#pragma mark - 自定义方法
/**
 *  根据数据源中的数据对自定义cell里的控件进行赋值
 *
 *  @param model 数据源
 */
- (void)assignmentUIWithModel:(LZNBaseModel *)model {
    NSLog(@"assignmentUIWithModel...");
    
    if (model && [model isKindOfClass:[LZNBaseModel class]]) {
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.bmIcon] placeholderImage:[UIImage imageNamed:@"Timeout"]];
        self.titleLabel.text = model.bmTitle;
        self.introLabel.text = model.bmIntro;
        self.ptypeAndAgeLabel.text = [NSString stringWithFormat:@"%@ ∙ %@",model.bmPtype,model.bmAge];
    } else {
        NSLog(@"Error: modelIsNotLZNBaseModel...");
    }
}

#pragma mark - getter
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, WIDTH-40, WIDTH-40)];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, WIDTH+40, WIDTH-40, 20)];
    }
    return _titleLabel;
}

- (UILabel *)introLabel {
    if (!_introLabel) {
        _introLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, WIDTH+40+20+10, WIDTH-40, 20)];
        _introLabel.font = [UIFont systemFontOfSize:15];
        _introLabel.textColor = [UIColor grayColor];
        _introLabel.numberOfLines = 0;
    }
    return _introLabel;
}

- (UILabel *)ptypeAndAgeLabel {
    if (!_ptypeAndAgeLabel) {
        _ptypeAndAgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, WIDTH+40+20+10+20+10, WIDTH-40, 20)];
        _ptypeAndAgeLabel.font = [UIFont systemFontOfSize:13];
        _ptypeAndAgeLabel.textColor = [UIColor grayColor];
        _ptypeAndAgeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _ptypeAndAgeLabel;
}

@end
