//
//  ListGroup.swift
//  Example
//
//  Created by 王楚江 on 2022/3/12.
//

import Markdown
import SwiftUI

struct ListGroup: View {
    @State private var mdStr: String = """
        List
        ===
        
        1. James Madison
        2. James Monroe
        3. John Quincy Adams
        
        ---
        
        1. 第一个列表项
           -  第一个嵌套列表项
             - 第二个嵌套列表项
                
        ---
        
        100. 第一个列表项
             - 第一个嵌套列表项
               - 第二个嵌套列表项
        
        ---
        
        - [x] #739
        - [ ] https://github.com/jaywcjlove/markdown
        - [ ] Add delight to the experience when all tasks are complete :tada:
        
        <!-- This content will not appear in the rendered Markdown -->
        """
    var body: some View {
        Markdown(content: $mdStr)
    }
}
