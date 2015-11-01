//
//  EnbleCommentView.m
//  14-封装评分控件
//
//  Created by silence on 15/10/30.
//  Copyright © 2015年 silence. All rights reserved.
//

#import "EnbleCommentView.h"

@interface EnbleCommentView ()
@property (nonatomic, strong) NSMutableArray *btnArray;     /**< 临时保存所有按钮 */
@end



@implementation EnbleCommentView

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
        self.interactive = YES;
        self.commentBtnWidth = 20;  // 默认宽高
        self.commentBtnPadding = 10;// 默认间距
        self.normalImage = [UIImage imageNamed:@"enabletap_comment_normal"];
        self.selectedImage = [UIImage imageNamed:@"enabletap_comment_selected"];
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    CGFloat btnW = self.commentBtnWidth;
    CGFloat btnH = btnW;
    CGFloat padding = self.commentBtnPadding;
    
    for (NSInteger i = 0; i < 5; i++ ) {
        CGFloat btnX = i * btnW + i * padding;
        UIButton *btn = self.btnArray[i];
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
//        [btn setImage:[UIImage imageNamed:@"enabletap_comment_normal"] forState:UIControlStateNormal];
//        [btn setImage:[UIImage imageNamed:@"enabletap_comment_selected"] forState:UIControlStateSelected];
        [btn setImage:self.normalImage forState:UIControlStateNormal];
        [btn setImage:self.selectedImage forState:UIControlStateSelected];
        btn.userInteractionEnabled = self.isInteractive;
    }
}

#pragma mark - Private Methods

- (void)btnClick:(UIButton *)button
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(enbleCommentView:btnClick:)]) {
        [self.delegate enbleCommentView:self btnClick:button];
    }
}


#pragma mark - Public Methods

- (void)refreshSelectedStateWithButton:(UIButton *)button
{
    for (UIButton *btn in self.btnArray) {
        
        if (btn.tag <= button.tag) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
}

- (void)refreshSelectedStateWithBtnCount:(NSUInteger)btnCount
{
    if (btnCount > self.btnArray.count) return;
    
    for (UIButton *btn in self.btnArray) {
        
        if (btn.tag - 100 + 1 <= btnCount) {
            btn.selected = YES;
        } else {
            btn.selected = NO;
        }
    }
}

#pragma mark - Getter and Setter

- (NSMutableArray *)btnArray
{
    if (!_btnArray) {
        _btnArray = [[NSMutableArray alloc] init];
        for (NSInteger i = 0; i < 5; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.adjustsImageWhenHighlighted = NO;
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            btn.tag = i + 100;
            [self.btnArray addObject:btn];
            [self addSubview:btn];
        }
    }
    return _btnArray;
}

- (void)setCommentBtnWidth:(CGFloat)commentBtnWidth
{
    _commentBtnWidth = commentBtnWidth;
    [self setupUI];
}


- (void)setCommentBtnPadding:(CGFloat)commentBtnPadding
{
    _commentBtnPadding = commentBtnPadding;
    [self setupUI];
}

- (void)setInteractive:(BOOL)interactive
{
    _interactive = interactive;
    [self setupUI];
}

- (void)setNormalImage:(UIImage *)normalImage
{
    _normalImage = normalImage;
    [self setupUI];
}

- (void)setSelectedImage:(UIImage *)selectedImage
{
    _selectedImage = selectedImage;
    [self setupUI];
}


@end
