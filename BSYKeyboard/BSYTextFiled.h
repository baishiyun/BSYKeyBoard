//
//  BSYTextFiled.h
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/28.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    BSYBoardTypeNone,
    BSYPhoneNumberType,
    BSYIDCardType,
    BSYPayType,
    BSYPassWordType,
}BSYBoardType;

@interface BSYTextFiled : UITextField
/**
 重写init方法
 @param frame frame
 @param keyBoardType 键盘类型
 @return 返回自己
 */
-(instancetype)initWithFrame:(CGRect)frame showKeyBoardType:(BSYBoardType)keyBoardType;

/**
 键盘背景颜色
 */
@property (nonatomic ,strong)UIColor *showKeyBoardBackColor;

/**
 按键背景颜色
 */
@property (nonatomic ,strong)UIColor *keyBoardItemBackColor;

/**
 按键字体颜色
 */
@property (nonatomic ,strong)UIColor *keyBoardItemTextColor;

/**
 键盘ToolBar颜色
 */
@property (nonatomic ,strong)UIColor *showKeyBoardToolBarBackColor;
/**
 键盘ToolBar 完成字体颜色
 */
@property (nonatomic ,strong)UIColor *showKeyBoardToolBarFinshinedBtnTitleColor;

/**
 键盘ToolBar title字体颜色
 */
@property (nonatomic ,strong)UIColor *showKeyBoardToolBarTitleColor;

/**
 键盘ToolBar titleString
 */
@property (nonatomic ,copy)NSString * showKeyBoardToolBarTitleString;
@end
