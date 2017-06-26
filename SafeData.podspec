
Pod::Spec.new do |s|

  s.name         = "SafeData"
  s.version      = "0.0.23"
  s.summary      = "Category for NSArray and NSDictionary to Protect Data prevent the crash.检查数据类型防止插入空数据和数组越界，字典直接得到转换后的OC,C类型"


  s.homepage     = "https://github.com/lishiping/SafeData.git"
  s.license      = "LICENSE"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "lishiping" => "83118274@qq.com" }

  s.ios.deployment_target = "6.0"

  s.source       = { :git => "https://github.com/lishiping/SafeData.git", :tag => s.version }

   s.source_files  = 'SafeData/SafeFoundation/*.{h,m,mm,cpp,c}', 'SafeData/SafeFoundation/*/*.{h,m,mm,cpp,c}'
   s.public_header_files = 'SafeData/SafeFoundation/*.h', 'SafeData/SafeFoundation/*/*.h'

  s.framework  = "Foundation"
  s.requires_arc = true

 # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include" }

end
