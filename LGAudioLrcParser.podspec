

Pod::Spec.new do |spec|

  spec.name         = "LGAudioLrcParser"
  spec.version      = "0.0.1"
  spec.summary      = "歌词解析类"
  spec.description  = <<-DESC
			歌词解析类。
                   DESC

  spec.homepage     = "https://github.com/BestRivenLG/LGAudioLrcParser"
  spec.license      = "MIT"
  spec.author             = { "BestRivenLG" => "373268232@qq.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/BestRivenLG/LGAudioLrcParser.git", :tag => "#{spec.version}" }
  # spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  # spec.exclude_files = "Classes/Exclude"
  # spec.public_header_files = "Classes/**/*.h"
  spec.frameworks = "Foundation", "UIKit"
  spec.requires_arc = true
  spec.dependency "Masonry"

  # Model
  spec.subspec 'Model' do |ss|
   ss.source_files		=	'LGAudioLrcParserDemo/LGAudioLrcParserDemo/LGAudioLrcParser/Model/**.{h,m}'
   ss.public_header_files	=	'LGAudioLrcParserDemo/LGAudioLrcParserDemo/LGAudioLrcParser/Model/**.h'	
  end

  # View
  spec.subspec 'View' do |ss|
   ss.source_files		=	'LGAudioLrcParserDemo/LGAudioLrcParserDemo/LGAudioLrcParser/View/**.{h,m}'
   ss.public_header_files	=	'LGAudioLrcParserDemo/LGAudioLrcParserDemo/LGAudioLrcParser/View/**.h'
   ss.dependency 'LGAudioLrcParser/Model'	
  end

end
