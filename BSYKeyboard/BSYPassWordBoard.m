//
//  BSYPassWordBoard.m
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/30.
//  Copyright © 2018年 BSY.com. All rights reserved.
//

#import "BSYPassWordBoard.h"

static NSString *const  defalutText = @"金贵创新支付安全输入";
@interface BSYPassWordBoard()
@property (nonatomic ,strong)NSMutableArray *arrayBig;
@property (nonatomic ,strong)NSMutableArray *arraySmall;

@property (nonatomic ,copy)NSString *pointString;
@end

@implementation BSYPassWordBoard

-(instancetype)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle
{
    self = [super initWithFrame:frame inputViewStyle:inputViewStyle];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
        self.pointString = @"";
        [self creatUIForBSYPayBoardWithArray:self.arraySmall];
    }
    return self;
}

-(void)creatUIForBSYPayBoardWithArray:(NSMutableArray *)currentArray
{
    
    CGFloat FontSize  = 0.0;
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==
        UIUserInterfaceIdiomPhone){
        FontSize  = 20.0;
    }else{
        FontSize  = 25.0;
    }

    //每个Item宽高
    CGFloat W = ([UIScreen mainScreen].bounds.size.width-18)/10.0;
    CGFloat H = 50;
    //每行列数
    NSInteger rank = 10;
    //每列间距
    CGFloat rankMargin =2;
    //每行间距
    CGFloat rowMargin = 2;

    NSArray *array = currentArray[0];
    NSArray *arrayTwo = currentArray[1];
     NSArray *arrayThree = currentArray[2];
    for (int index= 0 ; index< array.count; index++) {
        //Item X轴
        CGFloat X = (index % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (index/ rank) * (H +rowMargin);
        //Item top
        CGFloat top = 0;
        UIButton *KeyBoardItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [KeyBoardItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [KeyBoardItem setTitle:array[index] forState:UIControlStateNormal];
        KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:FontSize];
        KeyBoardItem.backgroundColor = [UIColor whiteColor];
        KeyBoardItem.layer.borderWidth = 1;
        KeyBoardItem.layer.borderColor  =[UIColor clearColor].CGColor;
        KeyBoardItem.layer.cornerRadius = 5;
        KeyBoardItem.layer.masksToBounds = true;
        KeyBoardItem.layer.rasterizationScale  = [[UIScreen mainScreen] scale];
        KeyBoardItem.layer.shouldRasterize = true;
        KeyBoardItem.frame = CGRectMake(X, Y+top, W, H);
        KeyBoardItem.tag = 1000000000+index;
        [self addSubview:KeyBoardItem];
        [KeyBoardItem addTarget:self action:@selector(KeyBoardItemActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }


    for (int index= 0 ; index< arrayTwo.count; index++) {
        //Item X轴
        CGFloat X = (index % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (index/ rank) * (H +rowMargin)+(H+rowMargin)*2;
        //Item top
        CGFloat top = 0;
        UIButton *KeyBoardItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [KeyBoardItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [KeyBoardItem setTitle:arrayTwo[index] forState:UIControlStateNormal];
        KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:FontSize];
        KeyBoardItem.backgroundColor = [UIColor whiteColor];
        KeyBoardItem.layer.borderWidth = 1;
        KeyBoardItem.layer.borderColor  =[UIColor clearColor].CGColor;
        KeyBoardItem.layer.cornerRadius = 5;
        KeyBoardItem.layer.masksToBounds = true;
        KeyBoardItem.layer.rasterizationScale  = [[UIScreen mainScreen] scale];
        KeyBoardItem.layer.shouldRasterize = true;
        KeyBoardItem.frame = CGRectMake(X+W/2.0, Y+top, W, H);
        KeyBoardItem.tag = 2000000000+index;
        [self addSubview:KeyBoardItem];
        [KeyBoardItem addTarget:self action:@selector(KeyBoardItemActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }


    for (int index= 0 ; index< arrayThree.count; index++) {
        //Item X轴
        CGFloat X = (index % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (index/ rank) * (H +rowMargin)+(H+rowMargin)*3;
        //Item top
        CGFloat top = 0;
        UIButton *KeyBoardItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [KeyBoardItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [KeyBoardItem setTitle:arrayThree[index] forState:UIControlStateNormal];
        KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:FontSize];
        KeyBoardItem.backgroundColor = [UIColor whiteColor];
        KeyBoardItem.layer.borderWidth = 1;
        KeyBoardItem.layer.borderColor  =[UIColor clearColor].CGColor;
        KeyBoardItem.layer.cornerRadius = 5;
        KeyBoardItem.layer.masksToBounds = true;
        KeyBoardItem.layer.rasterizationScale  = [[UIScreen mainScreen] scale];
        KeyBoardItem.layer.shouldRasterize = true;
        if (index==0) {
            KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:FontSize-5];
            KeyBoardItem.frame = CGRectMake(X+W/8.0, Y+top, W+W/4.0, H);
        }else if(index==arrayThree.count-1){
            KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:FontSize-5];
            KeyBoardItem.frame = CGRectMake(X+W/8.0+W/2, Y+top, W+W/4.0, H);
        }else{
            KeyBoardItem.frame = CGRectMake(X+W/2.0, Y+top, W, H);
        }
         KeyBoardItem.tag = 3000000000+index;
        [self addSubview:KeyBoardItem];
        [KeyBoardItem addTarget:self action:@selector(KeyBoardItemActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)KeyBoardItemActionClick:(UIButton *)finishedBtn
{

    if ([finishedBtn.currentTitle isEqualToString:@"ABC"]) {
        [self replaceKeyBoardItemTitleWithArray:self.arrayBig];
    }else  if ([finishedBtn.currentTitle isEqualToString:@"abc"]) {
        [self replaceKeyBoardItemTitleWithArray:self.arraySmall];
    }else{
        if (self.BSYPassWordBoardStringBlock) {
            self.BSYPassWordBoardStringBlock(finishedBtn.currentTitle);
        }
    }
}

/**
 替换键盘按钮

 @param array 传入的数组
 */
-(void)replaceKeyBoardItemTitleWithArray:(NSMutableArray *)array
{

    for (UIButton *KeyBoardItem in  self.subviews) {
        if (KeyBoardItem.tag>=1000000000&&KeyBoardItem.tag<2000000000) {
            NSArray *arrayBig  =[array objectAtIndex:0];
            for (int index=0; index<arrayBig.count; index++) {
                UIButton *btn = [self viewWithTag:index+1000000000];
                [btn setTitle:arrayBig[index] forState:UIControlStateNormal];
            }
        }else  if (KeyBoardItem.tag>=2000000000&&KeyBoardItem.tag<3000000000) {
            NSArray *arrayBig  =[array objectAtIndex:1];
            for (int index=0; index<arrayBig.count; index++) {
                UIButton *btn = [self viewWithTag:index+2000000000];
                [btn setTitle:arrayBig[index] forState:UIControlStateNormal];
            }
        }else  if (KeyBoardItem.tag>=3000000000) {
            NSArray *arrayBig  =[array objectAtIndex:2];
            for (int index=0; index<arrayBig.count; index++) {
                UIButton *btn = [self viewWithTag:index+3000000000];
                [btn setTitle:arrayBig[index] forState:UIControlStateNormal];
            }
        }

    }
}
/**
 键盘背景颜色
 @param showKeyBoardBackColor   键盘背景颜色
 */
-(void)setShowKeyBoardBackColor:(UIColor *)showKeyBoardBackColor
{
    self.backgroundColor = showKeyBoardBackColor?showKeyBoardBackColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
}

/**
 按键背景颜色
 @param keyBoardItemBackColor    按键背景颜色
 */
-(void)setShowKeyBoardItemBackColor:(UIColor *)keyBoardItemBackColor
{
    keyBoardItemBackColor = keyBoardItemBackColor?keyBoardItemBackColor:[UIColor whiteColor];
    for (UIButton *btn in self.subviews) {
        if (btn.tag>=1000000000) {
           btn.backgroundColor = keyBoardItemBackColor;
        }
    }
}
/**
 按键字体颜色
 @param keyBoardItemTextColor    按键字体颜色
 */
-(void)setShowKeyBoardItemTextColor:(UIColor *)keyBoardItemTextColor
{

    keyBoardItemTextColor = keyBoardItemTextColor?keyBoardItemTextColor:[UIColor blackColor];
    for (UIButton *btn in self.subviews) {
        if (btn.tag>=1000000000) {
            [btn setTitleColor:keyBoardItemTextColor forState:UIControlStateNormal];
        }
    }
}
-(NSMutableArray *)arrayBig
{
    if (!_arrayBig) {
        NSMutableArray *arrayOne = [NSMutableArray arrayWithObjects:@"1",@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",@"0", @"Q",@"W", @"E", @"R", @"T", @"Y", @"U", @"I", @"O",@"P", nil];
         NSMutableArray *arrayTwo = [NSMutableArray arrayWithObjects:@"A",@"S", @"D", @"F", @"G", @"H", @"J", @"K", @"L", nil];
        NSMutableArray *arrayThree = [NSMutableArray arrayWithObjects:@"abc",@"Z",@"X", @"C", @"V", @"B", @"N", @"M",@"Delete", nil];
        _arrayBig = [NSMutableArray arrayWithObjects:arrayOne,arrayTwo,arrayThree, nil];
    }
    return _arrayBig;
}

-(NSMutableArray *)arraySmall
{
    if (!_arraySmall) {

        NSMutableArray *arrayOne = [NSMutableArray arrayWithObjects:@"1",@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",@"0", @"q",@"w", @"e", @"r", @"t", @"y", @"u", @"i", @"o",@"p", nil];
        NSMutableArray *arrayTwo = [NSMutableArray arrayWithObjects:@"a",@"s", @"d", @"f", @"g", @"h", @"j", @"k", @"l", nil];
        NSMutableArray *arrayThree = [NSMutableArray arrayWithObjects:@"ABC", @"z",@"x", @"c", @"v", @"b", @"n", @"m",@"Delete", nil];
        _arraySmall = [NSMutableArray arrayWithObjects:arrayOne,arrayTwo,arrayThree, nil];
    }
    return _arraySmall;
}


@end
