//
//  ContentView.swift
//  Shared
//
//  Created by 王楚江 on 2022/3/10.
//

import SwiftUI
import Markdown

struct ContentView: View {
    @State private var mdStr: String = """
        ## Hello World
        \"\"\"sss
        content
        """
    var body: some View {
        VStack {
            Markdown(content: $mdStr).padding(10)
            TextEditor(text: $mdStr).frame(height: 100, alignment: .leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
