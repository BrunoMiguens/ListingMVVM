Pod::Spec.new do |s|
  s.name             = 'ListingMVVM'
  s.version          = '0.0.2'
  s.summary          = 'This iOS framework has the goal of creating a generic UITableView or UICollectionView.'

  s.description      = 'This iOS framework has the goal of creating a generic UITableView or UICollectionView to manage all the data and delegates using the MVVM architecture.'

  s.homepage         = 'https://github.com/BrunoMiguens/ListingMVVM'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Bruno Miguens' => 'brunomiguens@icloud.com' }
  s.source           = { :git => 'https://github.com/BrunoMiguens/ListingMVVM.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'LMVVM/*.{swift,plist}'

end
