//
//  BSYTextFiled.m
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/28.
//  Copyright © 2018年 BSY.com. All rights reserved.
//



#import "BSYTextFiled.h"
#import "BSYIDCardBoard.h"
#import "BSYPhoneNumberBoard.h"
#import "BSYPayBoard.h"
#import "BSYBoardToolBar.h"
#import "BSYPassWordBoard.h"
@interface BSYTextFiled()
@property (nonatomic ,strong)BSYIDCardBoard *bsy_idCardBoard;
@property (nonatomic ,strong)BSYPayBoard *bsy_PayBoard;
@property (nonatomic ,strong)BSYPhoneNumberBoard *bsy_phoneNumberBoard;
@property (nonatomic ,strong)BSYPassWordBoard *bsy_passWordBoard;
@property (nonatomic ,strong)BSYBoardToolBar *toolBar;
@property (nonatomic ,copy)NSString *currentString;
@end
@implementation BSYTextFiled

-(instancetype)initWithFrame:(CGRect)frame showKeyBoardType:(BSYBoardType)keyBoardType
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addViewWithKeyBoardType:keyBoardType];
        self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 35)];
        self.leftViewMode = UITextFieldViewModeAlways;
        self.currentString = @"";

        
    }
    return self;
}

/**
根据不同的键盘类型添加个字的键盘View
 @param keyBoardType 键盘类型
 */
-(void)addViewWithKeyBoardType:(BSYBoardType)keyBoardType
{

    UIView *window = [[[[[UIApplication sharedApplication] windows] lastObject] subviews] lastObject];

    NSLog(@"   %f",[window.subviews lastObject].frame.size.height);

    switch (keyBoardType) {
        case BSYIDCardType:
            self.inputAccessoryView =self.toolBar;
            [self BSYIDCardType:keyBoardType ];
            break;
        case BSYPhoneNumberType:
            self.inputAccessoryView =self.toolBar;
            [self BSYPhoneNumberBoardType:keyBoardType ];
            break;
        case BSYPayType:
            self.inputAccessoryView =self.toolBar;
            [self BSYPayBoardWithKeyBoardType:keyBoardType ];
            break;
        case BSYPassWordType:
            self.inputAccessoryView =self.toolBar;
            [self BSYPassWordBoardType:keyBoardType ];

            break;
        case BSYBoardTypeNone:

            break;
        default:
            break;
    }
    __weak typeof(self)selfWeak  =self;
    [self.toolBar setBSYBoardToolBarFinishedBtnBlock:^(NSString *currentString) {
        [selfWeak resignFirstResponder];
    }];
}
/**
 身份证的键盘
 */
-(void)BSYIDCardType:(BSYBoardType)keyBoardType
{
     self.inputView = self.bsy_idCardBoard;
    __weak typeof(self)selfWeak  =self;
    [self.bsy_idCardBoard setBSYIDCardBoardStringBlock:^(NSString *keyBoardString) {
        [selfWeak ProcessingResultingString:keyBoardString bsyBoard:selfWeak.bsy_idCardBoard];
    }];
}

/**
 手机号的键盘
 */
-(void)BSYPhoneNumberBoardType:(BSYBoardType)keyBoardType
{
    self.inputView = self.bsy_phoneNumberBoard;
    __weak typeof(self)selfWeak  =self;
    [self.bsy_phoneNumberBoard setBSYPhoneNumberBoardStringBlock:^(NSString *keyBoardString) {
        [selfWeak ProcessingResultingString:keyBoardString bsyBoard:selfWeak.bsy_phoneNumberBoard];
    }];
}

/**
 密码的键盘
 */
-(void)BSYPassWordBoardType:(BSYBoardType)keyBoardType
{

    self.inputView = self.bsy_passWordBoard;
    __weak typeof(self)selfWeak  =self;
    [self.bsy_passWordBoard setBSYPassWordBoardStringBlock:^(NSString *keyBoardString) {
        [selfWeak ProcessingResultingString:keyBoardString bsyBoard:selfWeak.bsy_passWordBoard];
    }];
}


/**
 支付的键盘
 */
-(void)BSYPayBoardWithKeyBoardType:(BSYBoardType)keyBoardType
{
    self.inputView = self.bsy_PayBoard;
    __weak typeof(self)selfWeak  =self;
    [self.bsy_PayBoard setBSYPayBoardStringBlock:^(NSString *keyBoardString) {
        [selfWeak ProcessingResultingString:keyBoardString bsyBoard:selfWeak.bsy_PayBoard];
    }];
}

/**
 字符串处理
 @param keyBoardString 当前字符串
 */
-(void)ProcessingResultingString:(NSString *)keyBoardString bsyBoard:(UIView *)bsyBoard
{
    if ([keyBoardString isEqualToString:@"Delete"]) {
        if (![self.currentString isEqualToString:@""]) {
            self.currentString = [self.currentString substringToIndex:self.currentString.length-1];
        }
        self.text = self.currentString;
    }else if ([keyBoardString isEqualToString:@"完成"]){
        [self resignFirstResponder];
    }else{
        self.currentString = [self.currentString stringByAppendingString:keyBoardString];
        self.text = self.currentString;
    }
}

/**
 键盘背景颜色
 */

-(void)setShowKeyBoardBackColor:(UIColor *)showKeyBoardBackColor
{
    _showKeyBoardBackColor = showKeyBoardBackColor;
    [self.bsy_idCardBoard setShowKeyBoardBackColor:showKeyBoardBackColor];
    [self.bsy_PayBoard setShowKeyBoardBackColor:showKeyBoardBackColor];
    [self.bsy_phoneNumberBoard setShowKeyBoardBackColor:showKeyBoardBackColor];
    [self.bsy_passWordBoard setShowKeyBoardBackColor:showKeyBoardBackColor];
}

/**
 按键背景颜色
 */
-(void)setKeyBoardItemBackColor:(UIColor *)keyBoardItemBackColor
{
    _keyBoardItemBackColor = keyBoardItemBackColor;
    [self.bsy_idCardBoard setShowKeyBoardItemBackColor:keyBoardItemBackColor];
    [self.bsy_PayBoard setShowKeyBoardItemBackColor:keyBoardItemBackColor];
    [self.bsy_phoneNumberBoard setShowKeyBoardItemBackColor:keyBoardItemBackColor];
    [self.bsy_passWordBoard setShowKeyBoardItemBackColor:keyBoardItemBackColor];

}

/**
 按键字体颜色
 */
-(void)setKeyBoardItemTextColor:(UIColor *)keyBoardItemTextColor
{
    _keyBoardItemTextColor = keyBoardItemTextColor;
    [self.bsy_idCardBoard setShowKeyBoardItemTextColor:keyBoardItemTextColor];
    [self.bsy_PayBoard setShowKeyBoardItemTextColor:keyBoardItemTextColor];
    [self.bsy_phoneNumberBoard setShowKeyBoardItemTextColor:keyBoardItemTextColor];
    [self.bsy_passWordBoard setShowKeyBoardItemTextColor:keyBoardItemTextColor];
}
/**
 键盘ToolBar颜色
 */
-(void)setShowKeyBoardToolBarBackColor:(UIColor *)showKeyBoardToolBarBackColor
{
    _showKeyBoardToolBarBackColor = showKeyBoardToolBarBackColor;
    [self.toolBar setShowKeyBoardToolBarBackColor:showKeyBoardToolBarBackColor];
}
/**
 键盘ToolBar 完成字体颜色
 */

-(void)setShowKeyBoardToolBarFinshinedBtnTitleColor:(UIColor *)showKeyBoardToolBarFinshinedBtnTitleColor
{
    _showKeyBoardToolBarFinshinedBtnTitleColor = showKeyBoardToolBarFinshinedBtnTitleColor;
    [self.toolBar setFinshinedBtnTitleColor:showKeyBoardToolBarFinshinedBtnTitleColor];
}
/**
 键盘ToolBar title字体颜色
 */
-(void)setShowKeyBoardToolBarTitleColor:(UIColor *)showKeyBoardToolBarTitleColor
{
    _showKeyBoardToolBarTitleColor  =showKeyBoardToolBarTitleColor;
    [self.toolBar setShowKeyBoardToolBarTitleColor:showKeyBoardToolBarTitleColor];
}

/**
 键盘ToolBar titleString
 */
-(void)setShowKeyBoardToolBarTitleString:(NSString *)showKeyBoardToolBarTitleString
{
    _showKeyBoardToolBarTitleString = showKeyBoardToolBarTitleString;
    [self.toolBar setShowKeyBoardToolBarTitleString:showKeyBoardToolBarTitleString];
}
/**
 创建身份证键盘View
 @return 返回键盘View
 */
-(BSYIDCardBoard *)bsy_idCardBoard
{
    if (!_bsy_idCardBoard) {
        _bsy_idCardBoard = [[BSYIDCardBoard alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 205) inputViewStyle:UIInputViewStyleDefault];
    }
    return _bsy_idCardBoard;
}

/**
 创建手机号键盘View
 @return 返回键盘View
 */
-(BSYPhoneNumberBoard *)bsy_phoneNumberBoard
{
    if (!_bsy_phoneNumberBoard) {
        _bsy_phoneNumberBoard = [[BSYPhoneNumberBoard alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 205) inputViewStyle:UIInputViewStyleDefault];
    }
    return _bsy_phoneNumberBoard;
}

/**
 创建支付键盘View
 @return 返回键盘View
 */
-(BSYPayBoard *)bsy_PayBoard
{
    if (!_bsy_PayBoard) {
        _bsy_PayBoard = [[BSYPayBoard alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 205) inputViewStyle:UIInputViewStyleDefault];
    }
    return _bsy_PayBoard;
}

/**
 创建密码键盘View
 @return 返回键盘View
 */
-(BSYPassWordBoard *)bsy_passWordBoard
{
    if (!_bsy_passWordBoard) {
        _bsy_passWordBoard = [[BSYPassWordBoard alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 205) inputViewStyle:UIInputViewStyleDefault];
    }
    return _bsy_passWordBoard;
}

/**
 创建ToolBarView
 @return 返回键盘View
 */
-(BSYBoardToolBar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[BSYBoardToolBar alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44.0)];
    }
    return _toolBar;
}

@end
