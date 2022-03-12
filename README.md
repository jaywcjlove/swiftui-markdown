Markdown
===

[![CI](https://github.com/jaywcjlove/markdown/actions/workflows/ci.yml/badge.svg)](https://github.com/jaywcjlove/markdown/actions/workflows/ci.yml)
![SwiftUI Support](https://shields.io/badge/SwiftUI-macOS%20v10.15%20%7C%20iOS%20v13-green?logo=Swift&style=flat)

Render Markdown text in SwiftUI. It is a preview based on the [`Marked`](https://github.com/markedjs/marked) implementation.

![Markdown Package Screenshot](https://user-images.githubusercontent.com/1680273/158006647-19d180e2-2549-4cd4-b108-91778beccc1b.png)

## Installation

You can add MarkdownUI to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Packages…
2. Enter https://github.com/jaywcjlove/markdown the Search or Enter Package URL search field
3. Link `Markdown` to your application target

Or add the following to `Package.swift`:

```swift
.package(url: "https://github.com/jaywcjlove/markdown", from: "1.0.0")
```

Or [add the package in Xcode](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app).

## Usage

```swift
import SwiftUI
import Markdown

struct ContentView: View {
  @State private var mdStr: String = """
    ## Hello World
    
    Render Markdown text in SwiftUI.
    """
  var body: some View {
    VStack {
      Markdown(content: $mdStr)
      TextEditor(text: $mdStr)
    }
  }
}
```

### `.markdownStyle()`

Setting markdown related styles.

```swift
Markdown(content: $mdStr)
  .markdownStyle(
      MarkdownStyle(
        padding: 0, paddingTop: 115, paddingBottom: 2, paddingLeft: 130, paddingRight: 5
      )
  )
```

```swift
Markdown(content: $mdStr)
  .markdownStyle(MarkdownStyle(padding: 35 ))
```

## Configure

<img width="666" alt="image" src="https://user-images.githubusercontent.com/1680273/158029436-cb6eb339-f698-4dcd-9508-acda79683aba.png">

## License

Licensed under the MIT License.
