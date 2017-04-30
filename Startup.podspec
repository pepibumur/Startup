Pod::Spec.new do |s|
  s.name         = "Startup"
  s.version      = "0.1.10"
  s.summary      = "Swift library that provides a declarative API for defining startup operations"
  s.description  = <<-DESC
    Startup is library that provides declarative components for defining apps startup operations.
  DESC
  s.homepage     = "https://github.com/pepibumur/Startup"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Pedro Piñera Buendía" => "pepibumur@gmail.com" }
  s.social_media_url   = "https://twitter.com/pepibumur"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.source           = { :git => "https://github.com/pepibumur/Startup.git", :tag => s.version.to_s }
  s.source_files  = "Sources/**/*"
  s.frameworks  = "Foundation"
end
