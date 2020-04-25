#
# Be sure to run `pod lib lint CJMViewCategory.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CJMViewCategory'
  s.version          = '0.1.0'
  s.summary          = '视图的接口扩展'

  s.description      = <<-DESC
视图的接口扩展，包括UIButton的点击动画，UIView的圆角设置，查找父视图等。
                       DESC

  s.homepage         = 'https://github.com/chenjm/CJMViewCategory'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chenjm' => 'cjiemin@163.com' }
  s.source           = { :git => 'https://github.com/chenjm/CJMViewCategory.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'CJMViewCategory/Classes/**/*'
  
end
