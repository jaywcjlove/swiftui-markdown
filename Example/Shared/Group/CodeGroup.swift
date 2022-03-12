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
        ## Code Block

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
        
        ```diff
        @@ -4,6 +4,5 @@
        -    let foo = bar.baz([1, 2, 3]);
        -    foo = foo + 1;
        +    const foo = bar.baz([1, 2, 3]) + 1;
             console.log(`foo: ${foo}`);
        ```
        
        ```jsx
        import CodeMirror from '@uiw/react-codemirror';
        import { javascript } from '@codemirror/lang-javascript';

        /**
         * Prism: Lightweight, robust, elegant syntax highlighting
         *
         * @license MIT <https://opensource.org/licenses/MIT>
         * @author Kenny Wong
         * @namespace
         * @public
         */
        
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
        
        ```css
        @media (prefers-color-scheme: light) {
          .markdown-body {
            color-scheme: light;
            --color-border-default: #d0d7de;
            --color-border-muted: hsla(210,18%,87%,1);
            --color-neutral-muted: rgba(175,184,193,0.2);
            /** --color-accent-fg: #0969da; **/
          }
        }

        .markdown-body kbd {
          color: var(--color-fg-default);
          vertical-align: middle;
          box-shadow: inset 0 -1px 0 var(--color-neutral-muted);
        }

        .markdown-body pre {
          margin-top: 0;
          margin-bottom: 0;
          font-family: ui-monospace,SFMono-Regular,SF Mono,Menlo,Consolas,Liberation Mono,monospace;
          font-size: 12px;
          word-wrap: normal;
        }
        ```
        
        ```html
        <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
        <script type="text/javascript">
        hotkeys('ctrl+a,ctrl+b,r,f', function (event, handler){
          switch (handler.key) {
            case 'ctrl+a': alert('you pressed ctrl+a!');
              break;
            // case 'f': alert('you pressed f!');
            //   break;
            default: alert(event);
          }
        });
        </script>
        ```
        
        """
    var body: some View {
        Markdown(content: $mdStr)
    }
}

