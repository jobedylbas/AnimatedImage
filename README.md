# AnimatedImage 🍿


[![License: MIT](https://img.shields.io/badge/License-MIT-brightgreen)](https://opensource.org/licenses/MIT)
[![Language](https://img.shields.io/badge/Swift-5-red)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS-blue)](https://www.apple.com/ios/ios-13/)

This package provides a easy way to create animations with image sequencies.

You can customize framerate, iterations, loop, where the loop starts and so on.

#### Requirements

* MacOS 10.15+
* iOS 13+

#### How to use

```Swift
struct ContentView: View {
  var imageNames: [String] 
  var body: some View {
  AnimatedImage(imageNames, interval: 0.025)
  }
}
```
