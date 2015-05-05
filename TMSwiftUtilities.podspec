
Pod::Spec.new do |s|
  s.name             = "TMSwiftUtilities"
  s.version          = "0.1.0"
  s.summary          = "A Swift utilitiy project"
  s.description      = <<-DESC
                       A helpful Swift Utility project 
                       DESC
  s.homepage         = "https://github.com/societymedia/SwiftUtilities.git"

  s.license          = 'MIT'
  s.author           = { "Tony Merante" => "merante@gmail.com" }
  s.source           = { :git => "https://github.com/societymedia/SwiftUtilities.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/jhack'

  s.platform     = :ios, '8.0'
  
  s.requires_arc = true

  s.source_files = '*.swift'
end
