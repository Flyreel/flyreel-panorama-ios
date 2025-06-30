# FlyreelPanorama

[![Swift 5.10 Supported](https://img.shields.io/badge/Swift-5.10-green.svg)](https://github.com/apple/swift) [![iOS 13](https://img.shields.io/badge/iOS-13+-orange.svg)](https://apple.com)

FlyreelPanorama is a Swift framework for capturing a 360 panorama, handling the entire flow from tutorial and 360 capture to provide the local file URL paths of the final captured bundle. This framework supports integration via Swift Package Manager, and can be used in both SwiftUI and UIKit codebases.

## Features

- SwiftUI/UIKit support
- Tutorial flow
- 360 panorama capture
- Local paths to stored bundle files

## Installation

### Swift Package Manager (SPM)

To add the package to your app:

1. Open Xcode and navigate to File > Add Packages.
2. Enter the repository URL: https://github.com/Flyreel/flyreel-panorama-ios.
3. Select the appropriate dependency rule (e.g., "Up to Next Major Version") and add it to your project.
4. Import the module where needed:

```swift
import FlyreelPanorama
```

For more information, refer to [Apple’s official guide](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app).

## Usage

### SwiftUI Example

To use the Panorama capture flow in SwiftUI, call `Panorama.push(navigation:clientID:onCompletion:)`
to return a view that can be pushed into a navigation context. When the flow completes, the `onCompletion`
handler is called with the final scan file URLs.

```swift
import SwiftUI
import FlyreelPanorama

struct ContentView: View {
    @State private var navigateToCapture = false

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Panorama.push(
                        navigation: $navigateToCapture,
                        clientID: "your-client-id",
                        onCompletion: { urls in
                            // Handle the scan URLs
                            print("Scan URLs: \(urls)")}
                    ),
                    isActive: $navigateToCapture,
                ) {
                    Text("Start Panorama Capture")
                }
            }
        }
    }
}
```

### UIKit Example

To use the Panorama capture flow in UIKit, call `Panorama.push(from:clientID:onCompletion:)`
to push the view controller onto a `UINavigationController`. When the flow completes,
the `onCompletion` handler is called with the final [URL].

```swift
import UIKit
import FlyreelPanorama

class ViewController: UIViewController {
    @IBAction func startPanoramaFlow(_ sender: Any) {
        guard let navController = self.navigationController else { return }

        Panorama.push(
            from: navController,
            clientID: "your-client-id",
            onCompletion: { urls in
                // Handle the scan URLs
                print("Scan URLs: \(urls)")
            }
        )
    }
}
```

## API Reference

### panoramaCaptureView

View instance modifier that presents panorama capture view as a full-screen cover.

#### Declaration

```swift
func panoramaCaptureView(
    isPresented: Binding<Bool>,
    clientID: String,
    onCaptureCompletion: @escaping ([URL]) -> Void
) -> some View
```

#### Parameters

- `isPresented`: A binding that controls whether the capture view is presented.
- `clientID`: A string representing the client ID required for authentication.
- `onCaptureCompletion`: A closure executed upon scan completion, providing an array of local URLs to the captured files.

### presentPanoramaCaptureView

View controller extension that presents panorama capture view as a full-screen cover.

#### Declaration

```swift
func presentPanoramaCaptureView(
    clientID: String,
    onCaptureCompletion: @escaping ([URL]) -> Void
)
```

#### Parameters

- `clientID`: A string representing the client ID required for authentication.
- `onCaptureCompletion`: A closure executed upon scan completion, providing an array of local URLs to the captured files.

## Permissions

To use the camera in your app, you need to add the following to your app's `Info.plist` file:

- `NSCameraUsageDescription`: A message that tells the user why your app needs access to the camera.

Here is an example of the key and value:

```
<key>NSCameraUsageDescription</key>
<string>We need access to the camera to capture images of your claim.</string>
```
