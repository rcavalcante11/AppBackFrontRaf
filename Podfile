platform :ios, '17.6'

target 'AppBackFront' do
  use_frameworks!

  # Pods for AppBackFront
  pod 'Alamofire', '~> 5.9'
  pod 'AlamofireImage', '~> 4.3'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '17.6'
    end
  end
end
