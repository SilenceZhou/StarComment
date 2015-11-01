//
//  ViewController.m
//  14-封装星星评论
//
//  Created by silence on 15/11/1.
//  Copyright © 2015年 silence. All rights reserved.
//

#import "ViewController.h"
#import "EnbleCommentView.h"

@interface ViewController () <EnbleCommentViewDelegate>
@property (nonatomic, strong) EnbleCommentView *commentView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.commentView];
//    self.commentView.backgroundColor = [UIColor blueColor];

}

#pragma mark - Properties

// 能点击星星图片时按钮的宽高：    20     间距10     总宽度 ： 20 * 5  + 10 * 4   =  100 + 40 = 140
// 不能点击星星图片时按钮的宽高度： 12    间距 4    总宽度 ： 12 * 5  +  4 * 4    = 60  + 16  = 76;
- (EnbleCommentView *)commentView
{
    if (!_commentView) {
        
        _commentView = [[EnbleCommentView alloc] initWithFrame:CGRectMake(50, 200, 140, 12)];
//        _commentView = [[EnbleCommentView alloc] initWithFrame:CGRectMake(50, 200, 140, 20)];
        _commentView.delegate = self;
        _commentView.commentBtnPadding = 4;
        _commentView.commentBtnWidth = 12;
        _commentView.interactive = YES;
        _commentView.normalImage = [UIImage imageNamed:@"constellation_star_gray"];
        _commentView.selectedImage = [UIImage imageNamed:@"constellation_star_yellow"];
    }
    return _commentView;
}

- (void)enbleCommentView:(EnbleCommentView *)enbleCommentView btnClick:(UIButton *)btn
{
    [enbleCommentView refreshSelectedStateWithButton:btn];
}


@end
