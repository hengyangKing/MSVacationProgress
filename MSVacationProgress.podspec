Pod::Spec.new do |spec|
  spec.name         = 'MSVacationProgress'
  spec.version      = '0.0.1'
  spec.license      = { :type => 'BSD' }
  spec.homepage     = 'https://github.com/tonymillion/Reachability'
  spec.authors      = {'hengyang king' => 'hengyangking@gmail.com' }
  spec.summary      = 'a progress view use for YQTeacher project for middle school vacation homework formation progress'
  spec.source       = { :git => 'https://github.com/hengyangKing/MSVacationProgress.git', :tag => 'spec.version' }
  spec.dependency 'Masonry'
  spec.source_files = './MSVacationProgress/**/*{h,m}'
  spec.framework  = 'UIKit'
  # spec.deployment_target  = '7.0'


end