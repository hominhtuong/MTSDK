Pod::Spec.new do |spec|

  spec.name         = "MTSDK"
  spec.version      = "2.0.1"
  spec.summary      = "Extesion some class for coding"
  spec.swift_version = ['5.1', '5.2', '5.3']
  
  spec.description  = <<-DESC
  This CocoaPods library helps you perform calculation
                   DESC

  spec.homepage     = "https://hominhtuong.com"
  spec.license      = { :type => "MIT", :file => "LICENSE" }



  spec.author             = { "Minh Tường" => "" }
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/hominhtuong/MTSDK.git", :tag => "#{spec.version}" }

  spec.source_files  = "MTSDK/**/*.{h,m,swift}"
 
  spec.dependency 'SnapKit', '~> 5.0.0'

end
