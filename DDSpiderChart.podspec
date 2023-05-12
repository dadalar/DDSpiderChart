Pod::Spec.new do |s|
  s.name             = 'DDSpiderChart'
  s.version          = '0.4.1'
  s.summary          = 'Easy to use Spider (Radar) Chart library for iOS written in Swift.'

  s.homepage         = 'https://github.com/dadalar/DDSpiderChart'
  s.screenshots      = 'https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/sample1.png', 'https://raw.githubusercontent.com/dadalar/DDSpiderChart/master/Screenshots/sample2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Deniz Adalar' => 'me@dadalar.net' }
  s.source           = { :git => 'https://github.com/dadalar/DDSpiderChart.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'

  s.source_files = 'Sources/DDSpiderChart/Classes/**/*'

end
