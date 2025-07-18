Pod::Spec.new do |spec|

  spec.name         = "FlyreelPanorama"
  spec.version      = "0.0.6"
  spec.summary      = "Flyreel Panorama."
  spec.homepage     = "https://risk.lexisnexis.com/products/flyreel"

  spec.license      = {
    :type => 'MIT',
    :text => <<-LICENSE
    Copyright (c) 2023 Flyreel

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
    LICENSE
  }
  
  spec.author       = "LexisNexis"
  spec.platform     = :ios, "13.0"
  spec.swift_version = "5.10"
  spec.cocoapods_version = '>= 1.16.2'

  spec.source       = { :git => "https://github.com/Flyreel/flyreel-panorama-ios.git", :tag => spec.version }
  spec.vendored_frameworks = 'FlyreelPanorama.xcframework'

  spec.frameworks = ['UIKit', 'SwiftUI', 'AVFoundation', 'MetalKit']

  spec.pod_target_xcconfig = { 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES' }
end