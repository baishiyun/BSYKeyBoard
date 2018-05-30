# BSYKeyBoard
BSYKeyBoard是一款自定义键盘，键盘类型有身份证类型键盘/密码键盘/支付键盘等，现在已经支持CocoaPods管理。有需要的同行直接集成就行！喜欢的话Star一下吧！


一、BSYKeyBoard是继承自UITextField来实现的，但是对UITextField的系统原有的方法/属性/代理/方法都做到了零调用。所以大家可以放心使用！下面总结一下使用方法：

1.需要使用的文本输入框继承集BSYTextFiled，初始化方法如下：

  BSYTextFiled *textField = [[BSYTextFiled alloc] initWithFrame:CGRectMake(100, 200, 200, 40) showKeyBoardType:BSYPhoneNumberType];
 
  其中BSYPhoneNumberType是指键盘类型，如果需要使用系统的键盘类型，则传入BSYBoardTypeNone类型即可。如果是自动布局，那么initWithFrame填入CGRectZero既可。
  
  BSYTextFiled的键盘类型有五种：BSYBoardTypeNone（系统键盘）/BSYPhoneNumberType（手机号键盘）/BSYIDCardType（身份证键盘）/BSYPayType（金额键盘）

  /BSYPassWordType（密码键盘）。
  
  
  二、BSYKeyBoard总共分为两个部分：BSYBoardToolBar和BSY···Board，BSYBoardToolBar是键盘工具栏 ，  BSY···Board是具体实现键盘的类！
  
  方法和属性分别有：
  
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
