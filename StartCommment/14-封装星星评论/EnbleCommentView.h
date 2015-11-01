//
//  EnbleCommentView.h
//  14-封装评分控件
//
//  Created by silence on 15/10/30.
//  Copyright © 2015年 silence. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EnbleCommentView;
@protocol EnbleCommentViewDelegate <NSObject>
@optional
/**
 *  点击了评论按钮星星
 */
- (void)enbleCommentView:(EnbleCommentView *)enbleCommentView btnClick:(UIButton *)btn;
@end


/**
 *   能评论的时按钮的宽高：   20   间距10     总宽度 ： 20 * 5  + 10 * 4   =  100 + 40 = 140
 *   不能评论时按钮的宽高度： 12    间距 4    总宽度 ： 12 * 5  +  4 * 4    = 60  + 16  = 76;
 *   区别：  宽度  间距  能否点击
 */
@interface EnbleCommentView : UIView

@property (nonatomic, weak) id<EnbleCommentViewDelegate> delegate;
@property (nonatomic, assign) CGFloat commentBtnWidth;                  /**< 评分星星按钮的宽度 */
@property (nonatomic, assign) CGFloat commentBtnPadding;                /**< 评分星星按钮的间距 */
@property (nonatomic, assign, getter=isInteractive) BOOL interactive;   /**< 是否能否进行点击， 默认是能进行点击的 */

@property (nonatomic, strong) UIImage *normalImage;                     /**< 正常状态的image */
@property (nonatomic, strong) UIImage *selectedImage;                   /**< 选中状态的image */

/**
 *  点击后进行状态的改变: 所有按钮有几个处于选中状态
 */
- (void)refreshSelectedStateWithButton:(UIButton *)button;

/**
 *  首次进来的时候对按钮的选中状态进行设置
 */
- (void)refreshSelectedStateWithBtnCount:(NSUInteger)btnCount;

@end
