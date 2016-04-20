//
//  PTHomeCollectionViewCell.m
//  kidsPlay
//
//  Created by Paul Wang on 16/1/15.
//  Copyright © 2016年 Paul Wang. All rights reserved.
//

#import "PTHomeCollectionViewCell.h"

@interface PTHomeCollectionViewCell ()

@property (nonatomic, strong) UIImageView   *mainImageView;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UILabel       *subTitleLabel;
@property (nonatomic, strong) UILabel       *categoryLabel;

@end

@implementation PTHomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.mainImageView];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.categoryLabel];
        self.contentView.layer.cornerRadius = 3.0f;
        self.contentView.layer.masksToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItem:(LZNBaseModel *)model forIndexPath:(NSIndexPath *)indexPath {
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:model.bmIcon] placeholderImage:[UIImage imageNamed:@"Timeout"]];
    switch (indexPath.row % 4) {
        case 0: case 3:
            self.mainImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width * (390.0f/350.0f));
            break;
        case 1: case 2:
            self.mainImageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.width);
            break;
        default:
            break;
    }
    self.titleLabel.text = model.bmTitle;
    self.subTitleLabel.text = model.bmIntro;
    self.categoryLabel.text = [NSString stringWithFormat:@"%@ · %@", model.bmPtype, model.bmAge];
    [self layoutSubviews];
}

- (CGFloat)heightForItem {
    return CGRectGetMaxY(self.categoryLabel.frame) + 10.0f;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    self.titleLabel.frame = CGRectMake(12, CGRectGetMaxY(self.mainImageView.frame) + 11.0f, self.frame.size.width - 24.0f, self.titleLabel.frame.size.height);
    
    
    self.subTitleLabel.frame = CGRectMake(self.titleLabel.frame.origin.x, CGRectGetMaxY(self.titleLabel.frame) + 6, self.frame.size.width - 24.0f, 0);
    [self.subTitleLabel sizeToFit];
    
    [self.categoryLabel sizeToFit];
    CGRect cateFrame = self.categoryLabel.frame;
    self.categoryLabel.frame = CGRectMake(self.frame.size.width - cateFrame.size.width-10.0f , CGRectGetMaxY(self.subTitleLabel.frame) + 10.0f, cateFrame.size.width, cateFrame.size.height);
}

#pragma mark - getters
- (UIImageView *)mainImageView {
    if (!_mainImageView) {
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _mainImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.numberOfLines = 0;
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
    }
    return _subTitleLabel;
}

- (UILabel *)categoryLabel {
    if (!_categoryLabel) {
        _categoryLabel = [[UILabel alloc] init];
        _categoryLabel.font = [UIFont systemFontOfSize:10];
    }
    return _categoryLabel;
}

@end
