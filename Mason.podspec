Pod::Spec.new do |spec|

  spec.name         = "Mason"
  spec.version      = "2.2.0"
  spec.summary      = "A simple JSON handle wrapper in Swift, making it available to handle JSON like JavaScript."

  spec.homepage     = "https://github.com/Monsoir/Mason"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Monsoir" => "raeyeung.mon@gmail.com" }
  spec.social_media_url   = "https://github.com/Monsoir"

  spec.swift_version = "5.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "10.0"
  spec.osx.deployment_target = "10.12"
  spec.watchos.deployment_target = "3.0"
  spec.tvos.deployment_target = "10.0"

  spec.source       = { :git => "https://github.com/Monsoir/Mason.git", :branch => "main", :tag => "#{spec.version}" }

  spec.source_files  = ["Sources/Mason/Mason.h", "Sources/Mason/**/*.swift"]

  spec.requires_arc = true

end
