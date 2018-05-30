//
//  BSYCertificateIdentification.m
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/28.
//  Copyright © 2018年 BSY.com. All rights reserved.
//



#import "BSYTextFiled.h"
#import "BSYIDCardBoard.h"
#import "BSYPayBoard.h"
#import "BSYBoardToolBar.h"

@interface BSYTextFiled()
@property (nonatomic ,strong)BSYIDCardBoard *bsy_idCardBoard;
@property (nonatomic ,strong)BSYPayBoard *bsy_PayBoard;
@property (nonatomic ,strong)BSYBoardToolBar *toolBar;
@property (nonatomic ,copy)NSString *currentString;
@property (nonatomic ,strong) UICollectionViewFlowLayout *layout;
@end
@implementation BSYTextFiled

-(instancetype)initWithFrame:(CGRect)frame showKeyBoardType:(BSYBoardType)keyBoardType
{
    self = [super initWithFrame:frame];
    if (self) {
        self.inputAccessoryView =self.toolBar;
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
    switch (keyBoardType) {
        case BSYIDCardType:
            [self BSYIDCardType:keyBoardType];
            break;
        case BSYPayType:
            [self BSYPayBoardWithKeyBoardType:keyBoardType];
            break;
        case BSYPassWordType:
            break;

        case BSYBoardTypeNone:
            self.inputAccessoryView = nil;
            self.inputView = nil;
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
    if ([keyBoardString isEqualToString:@"删除"]) {
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
 创建支付键盘View
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
