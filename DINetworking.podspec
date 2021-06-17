Pod::Spec.new do |spec|
  spec.name = "DINetworking"
  spec.version = "1.0.0"
  spec.summary = "Sample framework from blog post, not for real world use.Functional JSON parsing library for Swift."
  spec.homepage = "https://github.com/phoenixit99/DINetworking.git"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors = {
    "Hoang Nguyen" => 'hoanguit@gmail.com'
  }
  spec.social_media_url = "https://github.com/phoenixit99/DINetworking.git"

  spec.source = { :git => "https://github.com/phoenixit99/DINetworking.git", :tag => "v#{spec.version}", :submodules => true }
  spec.source_files  ="DINetworking/**/*.{h,swift}"
  spec.requires_arc = true
  spec.platform     = :ios
  spec.ios.deployment_target = "9.1"

  spec.dependency "Moya"
end