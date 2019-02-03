# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'News' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  # Pods for News
  pod 'Alamofire', '~> 4.7'

  pod 'AlamofireXmlToObjects'
  pod 'SwiftEventBus', :tag => '3.0.1', :git => 'https://github.com/cesarferreira/SwiftEventBus.git'

  
  target 'NewsTests' do
    inherit! :search_paths
    use_frameworks!
    pod 'FireMock' #, :git => 'https://github.com/pikaboo/FireMock.git', :branch => 'master'
    pod 'SwiftHamcrest', '~> 2.1.0'
  end

  target 'NewsUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
