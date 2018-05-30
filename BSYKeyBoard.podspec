Pod::Spec.new do |s|
  s.name         = "BSYKeyBoard" 
  s.version      = "1.1.0"     
  s.license      = "MIT"       
  s.summary      = "BSYKeyBoard是一款自定义键盘，键盘类型有身份证类型键盘/密码键盘/支付键盘/手机号键盘等。并且已经适配iphone和iPad所有机型，希望大家喜欢并Star支持"

  s.homepage     = "https://github.com/baishiyun/BSYKeyBoard" # 你的主页
  s.source       = { :git => "https://github.com/baishiyun/BSYKeyBoard.git", :tag => "#{s.version}" }
  s.source_files = "BSYKeyBoard/*.{h,m}"
  s.requires_arc = true 
  s.platform     = :ios, "7.0" 
  s.frameworks   = "UIKit", "Foundation"
  s.author             = { "白仕云" => "baishiyun@163.com" } 
  s.social_media_url   = "https://github.com/baishiyun" 

end