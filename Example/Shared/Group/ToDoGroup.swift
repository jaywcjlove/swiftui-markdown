//
//  ToDoGroup.swift
//  Example
//
//  Created by 王楚江 on 2022/3/11.
//
import Markdown
import SwiftUI

struct ToDoGroup: View {
    @State private var mdStr: String = """
        To Do
        ===
                
        - [ ] title 1
        - [x] title 2
        - [ ] title 3
            - [ ] sub title 1
            - [x] sub title 2
            - [ ] sub title 3
        - [ ] title 4
        - [x] title 5
        - [x] title 6
        
        """
    var body: some View {
        Markdown(content: $mdStr)
    }
}
