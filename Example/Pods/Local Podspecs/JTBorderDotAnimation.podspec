Pod::Spec.new do |s|
  s.name         = "JTBorderDotAnimation"
  s.version      = "1.0.0"
  s.summary      = "A simple animation with dots turning around a UIView for iOS"
  s.homepage     = "https://github.com/jonathantribouharet/JTBorderDotAnimation"
  s.license      = { :type => 'MIT' }
  s.author       = { "Jonathan Tribouharet" => "jonathan.tribouharet@gmail.com" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "https://github.com/jonathantribouharet/JTBorderDotAnimation.git", :tag => s.version.to_s }
  s.source_files  = 'JTBorderDotAnimation/*'
  s.requires_arc  = true
  s.screenshots   = ["https://raw.githubusercontent.com/jonathantribouharet/JTBorderDotAnimation/master/Screens/example.gif"]
end
