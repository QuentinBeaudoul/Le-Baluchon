platform :ios, '11.0'

use_frameworks!

workspace 'Le Baluchon.xcworkspace'

pod 'SwiftLint'

target 'LBNetwork' do
  project 'Network/LBNetwork.xcodeproj'

	pod 'Alamofire'
end

target 'Exchange Rates' do
  project 'Exchange Rates/Exchange Rates.xcodeproj'

  	pod 'LoadableViews'
	
	target 'ExchangeRatesTests' do
		inherit! :complete
		pod 'R.swift'
		pod 'Alamofire'
	end
end		

target 'Weather' do
  project 'Weather/Weather.xcodeproj'

	pod 'LoadableViews'
end

target 'Translate' do
  project 'Translate/Translate.xcodeproj'

  pod 'LoadableViews'

	target 'TranslateTests' do
		inherit! :complete
		pod 'LoadableViews'
		pod 'R.swift'
		pod 'Alamofire'
	end
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
