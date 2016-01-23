use_frameworks!

source "https://github.com/PopcornTimeTV/Specs.git"
source 'https://github.com/CocoaPods/Specs'

target 'PopcornTime' do
  link_with 'PopcornTime', 'PopcornKit', 'PopcornKitTests', 'PopcornExtension'
  pod 'Genome'
  pod "SnapKit"
  pod "RXHTTPCommander"
  pod 'ReduxKit', '~> 0.1'
  pod 'Localize-Swift', :git => "https://github.com/pepibumur/localize-swift"
  pod "PopcornTorrent"
end

target 'Tests' do
  link_with 'PopcornKitTests'
  pod 'Quick'
  pod 'Nimble'
end
