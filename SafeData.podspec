
Pod::Spec.new do |s|

  s.name         = "SafeData"
  s.version      = "0.0.1"
  s.summary      = “Create Category for NSArray and NSDictionary to Protect Data.”

  s.description  = <<-DESC

In the judgement before using arrays and dictionaries, protect the data

                   DESC

  s.homepage     = "https://github.com/lishiping/SafeData"
  s.license      = "MIT (example)"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }

  s.author             = { "lishiping" => “83118274@qq.com" }

  s.ios.deployment_target = "5.0"

  s.source       = { :git => "https://github.com/lishiping/SafeData", :tag => "0.0.1" }

   s.source_files  = 'SafeData/SafeFoundation/*.{h,m,mm,cpp,c}', 'SafeData/SafeFoundation/*/*.{h,m,mm,cpp,c}'
   s.public_header_files = 'SafeData/SafeFoundation/*.h', 'SafeData/SafeFoundation/*/*.h'

  # s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # s.public_header_files = "Classes/**/*.h"


  s.framework  = "Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"
  # s.libraries = "iconv", "xml2"

  s.requires_arc = true

  s.xcconfig = { "HEADER_SEARCH_PATHS" => “$(SDKROOT)/usr/include” }
  # s.dependency "JSONKit", "~> 1.4"

end
