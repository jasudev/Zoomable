# **Zoomable**
It is a container that allows you to zoom in and out of an image using only SwiftUI.

[![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS-blue?style=flat-square)](https://developer.apple.com/macOS)
[![iOS](https://img.shields.io/badge/iOS-13.0-blue.svg)](https://developer.apple.com/iOS)
[![macOS](https://img.shields.io/badge/macOS-11.0-blue.svg)](https://developer.apple.com/macOS)
[![instagram](https://img.shields.io/badge/instagram-@dev.fabula-orange.svg?style=flat-square)](https://www.instagram.com/dev.fabula)
[![SPM](https://img.shields.io/badge/SPM-compatible-red?style=flat-square)](https://developer.apple.com/documentation/swift_packages/package/)
[![MIT](https://img.shields.io/badge/licenses-MIT-red.svg)](https://opensource.org/licenses/MIT)  

## Screenshot
<img src="Markdown/Zoomable.gif">

## Example Usages
1. ZoomableView
    ```swift
    ZoomableView(size: CGSize(width: 300, height: 300), min: 1.0, max: 6.0, showsIndicators: true) {
        Image("image")
            .resizable()
            .scaledToFit()
            .background(Color.black)
            .clipped()
    }
    ```

        
3. ZoomableImageView
    ```swift
    ZoomableImageView(url: url, min: 1.0, max: 3.0, showsIndicators: true) {
        Text("ZoomableImageView")
            .padding()
            .background(Color.black.opacity(0.5))
            .cornerRadius(8)
            .foregroundColor(Color.white)
    }
    ```

## Dependencies
```
dependencies: [
    .package(url: "https://github.com/SDWebImage/SDWebImage.git", .branch("master")),
    .package(url: "https://github.com/SDWebImage/SDWebImageSwiftUI.git", .branch("master"))
]
```

## Contact
instagram : [@dev.fabula](https://www.instagram.com/dev.fabula)  
email : [dev.fabula@gmail.com](mailto:dev.fabula@gmail.com)

## License
Zoomable is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
