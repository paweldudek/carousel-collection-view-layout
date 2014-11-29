Pod::Spec.new do |s|
  s.name = 'CarouselCollectionViewLayout'
  s.version = '1.0.0'
  s.summary = 'Carousel collection view layout with custom item size and per-item scroll snapping.'

  s.license =  {:type => 'MIT' }
  s.homepage = 'https://github.com/paweldudek/carousel-collection-view-layout'
  s.authors = { 'Paweł Dudek' => 'hello@dudek.mobi' }
  s.social_media_url = 'https://twitter.com/eldudi'

  s.source =  { :git => 'https://github.com/paweldudek/carousel-collection-view-layout.git', :tag => "v#{s.version}" }
  s.source_files = 'CarouselCollectionViewLayout/Classes/Lib/*'

  s.platform     = :ios, '7.0'
  s.framework = 'UIKit'
  s.requires_arc = true
end
