//
//  BSYIDCardBoardReusableView.h
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/29.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BSYBoardToolBar : UIView

@property (nonatomic ,copy)void(^BSYBoardToolBarFinishedBtnBlock)(NSString *currentString);
/**
 键盘ToolBar 完成字体颜色
 @param finshinedBtnTitleColor 完成字体颜色
 */
-(void)setFinshinedBtnTitleColor:(UIColor *)finshinedBtnTitleColor;

/**
 键盘ToolBar颜色
 @param showKeyBoardToolBarBackColor  键盘ToolBar颜色
 */
-(void)setShowKeyBoardToolBarBackColor:(UIColor *)showKeyBoardToolBarBackColor;

/**
 键盘ToolBar title字体颜色
 @param showKeyBoardToolBarTitleColor   title字体颜色
 */
-(void)setShowKeyBoardToolBarTitleColor:(UIColor *)showKeyBoardToolBarTitleColor;

/**
 键盘ToolBar titleString
 @param showKeyBoardToolBarTitleString   titleString
 */
-(void)setShowKeyBoardToolBarTitleString:(NSString *)showKeyBoardToolBarTitleString;
@end
