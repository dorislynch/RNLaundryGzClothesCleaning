
Pod::Spec.new do |s|
  s.name         = "RNLaundryGzClothesCleaning"
  s.version      = "1.0.3"
  s.summary      = "RNLaundryGzClothesCleaning"
  s.description  = <<-DESC
                  RNLaundryGzClothesCleaning
                   DESC
  s.homepage     = "https://github.com/dorislynch/LaundryGzClothesCleaning"
  s.license      = "MIT"
                   # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/dorislynch/LaundryGzClothesCleaning.git", :tag => "master" }
  s.source_files  = "ios/**/*.{h,m}"
  s.requires_arc = true
                 
                 
  s.dependency 'React'
  s.dependency 'CocoaSecurity'
  s.dependency 'GCDWebServer'
  #s.dependency "others"

end

  