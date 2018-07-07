

Pod::Spec.new do |s|

  s.name         = "SKAlert"
  s.version      = "1.0.0"
  s.summary      = "Simple alert with simple functionality"
  s.description  = "Simple alert with simple functionality. A simple framework for asimpler alert, with simple usage."
  s.homepage     = "https://github.com/srujankalvacherla/SKAlert/"
  s.license      = "MIT"
  s.author             = { "Srujan K" => "Srujan K" }
  s.platform     = :ios
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/srujankalvacherla/SKAlert", :tag => "1.0.0" }
  s.source_files  = "SKAlert", "SKAlert/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4' }

end
