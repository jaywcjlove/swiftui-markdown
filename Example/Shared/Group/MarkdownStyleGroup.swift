//
//  PaddingGroup.swift
//  Example
//
//  Created by 王楚江 on 2022/3/11.
//

import Markdown
import SwiftUI

struct MarkdownStyleGroup: View {
    @State private var mdStr: String = """
        .markdownStyle()
        ===

        Render Markdown text in SwiftUI. It is a preview based on the [`Marked`](https://github.com/markedjs/marked) implementation.
        
        ## Usage
        
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
        
        ## `.markdownStyle()`

        ```swift
        import SwiftUI
        import Markdown

        struct ContentView: View {
            @State private var mdStr: String = \"\""
              ## Hello World
              
              Render Markdown text in SwiftUI.
              \"\""
            var body: some View {
              VStack {
                Markdown(content: $mdStr)
                    .markdownStyle(
                        MarkdownStyle(padding: 0, paddingTop: 115, paddingBottom: 2, paddingLeft: 130, paddingRight: 5)
                    )
              }
            }
        }
        ```

        ## License

        Licensed under the MIT License.
        
        """
    var body: some View {
        Markdown(content: $mdStr)
//            .markdownStyle(MarkdownStyle(padding: 90))
            .markdownStyle(MarkdownStyle(
                paddingTop: 100, paddingBottom: 55, paddingLeft: 88, paddingRight: 23
            ))

//            .markdownStyle(MarkdownStyle(padding: 0, paddingTop: 115, paddingBottom: 2, paddingLeft: 130, paddingRight: 5))
    }
}
