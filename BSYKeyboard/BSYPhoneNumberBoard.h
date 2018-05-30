//
//  BSYPhoneNumberBoard.h
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/30.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BSYPhoneNumberBoard : UIInputView

@property (nonatomic ,copy)void(^BSYPhoneNumberBoardStringBlock)(NSString *keyBoardString);
/**
 键盘背景颜色
 @param showKeyBoardBackColor   键盘背景颜色
 */
-(void)setShowKeyBoardBackColor:(UIColor *)showKeyBoardBackColor;

/**
 按键背景颜色
 @param keyBoardItemBackColor    按键背景颜色
 */
-(void)setShowKeyBoardItemBackColor:(UIColor *)keyBoardItemBackColor;


/**
 按键字体颜色
 @param keyBoardItemTextColor    按键字体颜色
 */
-(void)setShowKeyBoardItemTextColor:(UIColor *)keyBoardItemTextColor;
@end
