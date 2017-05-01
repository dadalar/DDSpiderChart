#
# Be sure to run `pod lib lint DDSpiderChart.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DDSpiderChart'
  s.version          = '0.1.0'
  s.summary          = 'Easy to use Spider (Radar) Chart library for iOS written in Swift.'

  s.homepage         = 'https://github.com/dadalar/DDSpiderChart'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Deniz Adalar' => 'me@dadalar.net' }
  s.source           = { :git => 'https://github.com/dadalar/DDSpiderChart.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DDSpiderChart/Classes/**/*'

end
