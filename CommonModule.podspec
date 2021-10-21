Pod::Spec.new do |spec|
  spec.name = "CommonModule"
  spec.version = "1.0.0"
  spec.summary = "Sample framework from blog post, not for real world use.Functional JSON parsing library for Swift."
  spec.homepage = "https://github.com/wata-chinhtran/CommonModule.git"
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors = {
    "Chinh Tran" => 'chinh.tran@watasolutions.com'
  }
  spec.social_media_url = "https://github.com/wata-chinhtran/CommonModule.git"

  spec.source = { :git => "https://github.com/wata-chinhtran/CommonModule.git", :tag => "1.0.0", :submodules => true }
  spec.source_files  = "CommonModule/**/*.{h,swift}"
  spec.requires_arc = true
  spec.platform     = :ios
  spec.ios.deployment_target = "12.0"

  spec.dependency "Moya"
  spec.dependency "Kingfisher"
  
end
