//
//  CodeGroup.swift
//  Example
//
//  Created by 王楚江 on 2022/3/11.
//

import Markdown
import SwiftUI

struct CodeGroup: View {
    @State private var mdStr: String = """
        ## SwiftUI Code Preview

        ```swift
        import SwiftUI
        import Markdown

        struct ContentView: View {
        @State private var mdStr: String = \"\"\"
              ## Hello World
              
              Render Markdown text in SwiftUI.
              \"\"\"
            var body: some View {
              VStack {
                Markdown(content: $mdStr)
                TextEditor(text: $mdStr)
              }
            }
        }
        ```
        
        ```jsx
        import CodeMirror from '@uiw/react-codemirror';
        import { javascript } from '@codemirror/lang-javascript';
        
        export default function App() {
          return (
            <CodeMirror
              value="console.log('hello world!');"
              height="200px"
              extensions={[javascript({ jsx: true })]}
              onChange={(value, viewUpdate) => {
                console.log('value:', value);
              }}
            />
          );
        }
        ```
        """
    var body: some View {
        Markdown(content: $mdStr)
    }
}

