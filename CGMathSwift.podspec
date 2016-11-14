#
# Be sure to run `pod lib lint CGMathSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CGMathSwift'
  s.version          = '0.2.0'
  s.summary          = 'A collection of extensions for CoreGraphics'

  s.description      = <<-DESC
CGMathSwift is a collection of extensions for CoreGraphics data types to help you perform calculations with them.

For CGFloat, Float and Double types, it includes functions like lerp, inverse lerp, clamp and remap.

It also adds basic math operations (+, -, *, /) to CGPoint, as well as lerp and other useful properties and initializers to CGPoint, CGSize and CGRect.

These extensions are designed to make developing animations easier
                       DESC

  s.homepage         = 'https://github.com/EmilioPelaez/CGMathSwift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Emilio Peláez' => 'i.am@emiliopelaez.me' }
  s.source           = { :git => 'https://github.com/EmilioPelaez/CGMathSwift.git', :tag => s.version.to_s }
	s.social_media_url = 'https://twitter.com/EmilioPelaez'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CGMathSwift/Classes/**/*'
end
