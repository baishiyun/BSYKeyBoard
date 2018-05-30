//
//  BSYCertificateIdentificationView.m
//  BSYKeyboard
//
//  Created by 白仕云 on 2018/5/28.
//  Copyright © 2018年 BSY.com. All rights reserved.
//



#import "BSYIDCardBoard.h"
static NSString *const  defalutText = @"金贵创新安全输入";

@interface BSYIDCardBoard()
@property (nonatomic ,strong)NSMutableArray *array;
@end
@implementation BSYIDCardBoard

-(instancetype)initWithFrame:(CGRect)frame inputViewStyle:(UIInputViewStyle)inputViewStyle
{
    self = [super initWithFrame:frame inputViewStyle:inputViewStyle];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self creatUIForBSYIDCardBoard];
    }
    return self;
}

-(void)creatUIForBSYIDCardBoard
{
    //每个Item宽高
    CGFloat W = ([UIScreen mainScreen].bounds.size.width-6)/3.0;
    CGFloat H = 50;
    //每行列数
    NSInteger rank = 3;
    //每列间距
    CGFloat rankMargin =2;
    //每行间距
    CGFloat rowMargin = 2;
    for (int index= 0 ; index< self.array.count; index++) {
        //Item X轴
        CGFloat X = (index % rank) * (W + rankMargin);
        //Item Y轴
        NSUInteger Y = (index/ rank) * (H +rowMargin);
        //Item top
        CGFloat top = 0;
         UIButton *KeyBoardItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [KeyBoardItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [KeyBoardItem setTitle:self.array[index] forState:UIControlStateNormal];
        KeyBoardItem.titleLabel.font = [UIFont systemFontOfSize:25];
        KeyBoardItem.backgroundColor = [UIColor whiteColor];
        KeyBoardItem.layer.borderWidth = 1;
        KeyBoardItem.layer.borderColor  =[UIColor clearColor].CGColor;
        KeyBoardItem.layer.cornerRadius = 5;
        KeyBoardItem.layer.masksToBounds = true;
        KeyBoardItem.layer.rasterizationScale  = [[UIScreen mainScreen] scale];
        KeyBoardItem.layer.shouldRasterize = true;
        KeyBoardItem.frame = CGRectMake(X, Y+top, W, H);
        [self addSubview:KeyBoardItem];
        [KeyBoardItem addTarget:self action:@selector(KeyBoardItemActionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
-(void)KeyBoardItemActionClick:(UIButton *)finishedBtn
{
    if (self.BSYIDCardBoardStringBlock) {
        self.BSYIDCardBoardStringBlock(finishedBtn.currentTitle);
    }
}
/**
 键盘背景颜色
 @param showKeyBoardBackColor   键盘背景颜色
 */
-(void)setShowKeyBoardBackColor:(UIColor *)showKeyBoardBackColor
{
    self.backgroundColor = showKeyBoardBackColor?showKeyBoardBackColor:[UIColor grayColor];
}

/**
 按键背景颜色
 @param keyBoardItemBackColor    按键背景颜色
 */
-(void)setShowKeyBoardItemBackColor:(UIColor *)keyBoardItemBackColor
{


}
/**
 按键字体颜色
 @param keyBoardItemTextColor    按键字体颜色
 */
-(void)setShowKeyBoardItemTextColor:(UIColor *)keyBoardItemTextColor
{


}
-(NSMutableArray *)array
{
    if (!_array) {
        _array = [NSMutableArray arrayWithObjects:@"1",@"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9",@"X", @"0",@"删除",  nil];
    }
    return _array;
}

@end
