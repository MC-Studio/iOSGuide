#
# Be sure to run `pod lib lint TIRouterAction.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'NLRouterAction'
  s.version          = '0.1.0'
  s.summary          = 'A short description of NLRouterAction.方便提供路由动作处理逻辑'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/rakeyang/NLRouterAction'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rake Yang' => 'fenglaijun@gmail.com' }
  s.source           = { :git => 'https://github.com/rakeyang/NLRouterAction.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'NLRouterAction/Classes/**/*'
  s.prefix_header_contents = '#import <NLLogger/NLLogger.h>'
  s.script_phase = { :name => '[Peregrine] Generator Routing Table', :script => 'ruby ${PODS_ROOT}/Peregrine/Peregrine/PGGenerator.rb "${PODS_CONFIGURATION_BUILD_DIR}/Neverland.app/Peregrine.bundle"' }

   s.resource_bundles = {
     'NLRouterAction' => ['NLRouterAction/Assets/*']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'MBProgressHUD'
  s.dependency 'Peregrine', '~> 0.5'
  s.dependency 'MCUIKit', '~> 0.3'
  s.dependency 'MCLogger', '~> 0.6'
  s.dependency 'MCJSONKit', '~> 0.5'
  s.dependency 'Masonry', '~> 1.0'

end
