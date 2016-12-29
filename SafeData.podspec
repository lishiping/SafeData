
Pod::Spec.new do |s|

  s.name         = "SafeData"
  s.version      = "0.0.5"
  s.summary      = "Create Category for NSArray and NSDictionary to Protect Data."

  s.description  = <<-DESC

In the judgement before using arrays and dictionaries, protect the data
DESC

  s.homepage     = "https://github.com/lishiping/SafeData.git"
  s.license      = "LICENSE"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "lishiping" => "83118274@qq.com" }

  s.ios.deployment_target = "7.0"

  s.source       = { :git => "https://github.com/lishiping/SafeData.git", :tag => "0.0.5" }

   s.source_files  = 'SafeData/SafeFoundation/*.{h,m,mm,cpp,c}', 'SafeData/SafeFoundation/*/*.{h,m,mm,cpp,c}'
   s.public_header_files = 'SafeData/SafeFoundation/*.h', 'SafeData/SafeFoundation/*/*.h'

  s.framework  = "Foundation"
  s.requires_arc = true

  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include" }

end
