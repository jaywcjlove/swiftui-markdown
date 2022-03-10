Markdown
===

![](https://img.shields.io/badge/platform-macOS%20%7C%20iOS-lightgrey.svg)

Render Markdown text in SwiftUI. It is a preview based on the [`Marked`](https://github.com/markedjs/marked) implementation.

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

## Installation

You can add MarkdownUI to an Xcode project by adding it as a package dependency.

1. From the File menu, select Add Packages…
2. Enter https://github.com/jaywcjlove/markdown the Search or Enter Package URL search field
3. Link `Markdown` to your application target

## License

Licensed under the MIT License.
