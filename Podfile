platform :ios, '13.0'

use_frameworks!

workspace 'Le Baluchon.xcworkspace'

pod 'SwiftLint'

target 'Network' do
  project 'Network/Network.xcodeproj'

	pod 'Alamofire', '~> 5.5'

  target 'NetworkTests' do
  end
end

target 'Exchange Rates' do
  project 'Exchange Rates/Exchange Rates.xcodeproj'

  pod 'LoadableViews'
end		

target 'Weather' do
  project 'Weather/Weather.xcodeproj'

	pod 'LoadableViews'
end

target 'Translate' do
  project 'Translate/Translate.xcodeproj'

  pod 'LoadableViews'
end

target 'Extension' do
  project 'Extension/Extension.xcodeproj'

  pod 'R.swift'
end			

target 'Le Baluchon' do
  project 'Le Baluchon/Le Baluchon.xcodeproj'

	pod 'Alamofire', '~> 5.5'
  pod 'R.swift'
  pod 'LoadableViews'
end
