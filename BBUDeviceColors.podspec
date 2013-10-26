Pod::Spec.new do |s|
  s.name         = 'BBUDeviceColors'
  s.version      = '0.0.1'
  s.summary      = 'Category which gives you the front and back colors of an iOS device as UIColor objects.'
  s.homepage     = 'https://github.com/neonichu/BBUDeviceColors'
  s.license      = {:type => 'MIT', :file => 'LICENSE'}
  s.authors      = { 'Boris Bügling' => 'http://buegling.com' }
  s.source       = { :git => 'https://github.com/neonichu/BBUDeviceColors.git', :tag => s.version.to_s }
  s.platform     = :ios, '7.0'
  
  s.public_header_files = 'UIDevice+Colors.h'
  s.source_files = 'UIDevice+Colors.{h,m}'
  s.frameworks = 'UIKit'
  s.requires_arc = true
end
