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
            Markdown(content: $mdStr)
            TextEditor(text: $mdStr)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
