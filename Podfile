use_frameworks!

target 'PopcornTime' do
  link_with 'PopcornTime', 'PopcornKit', 'PopcornKitTests', 'PopcornExtension'
  pod 'CocoaSecurity'
  pod 'Genome'
  pod "SnapKit"
  pod "RXHTTPCommander"
  pod 'ReduxKit', '~> 0.1'
  pod 'Localize-Swift', :git => "https://github.com/pepibumur/localize-swift"
end

target 'Tests' do
  link_with 'PopcornKitTests'
  pod 'Quick'
  pod 'Nimble'
end
