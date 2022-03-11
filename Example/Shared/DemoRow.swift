//
//  DemoRow.swift
//  Example
//
//  Created by 王楚江 on 2022/3/11.
//

import SwiftUI

struct DemoRow<ContentView: View>: View {
    var title: String?
    var systemImage: String?
    let selection: Binding<String?>
    let tag: String
    let content: () -> ContentView
    init(title: String?, systemImage: String?, tag: String, selection: Binding<String?>, @ViewBuilder content: @escaping () -> ContentView) {
        self.content = content
        self.title = title
        self.tag = tag
        self.systemImage = systemImage
        self.selection = selection
    }

  var body: some View {
      NavigationLink(tag: tag, selection: selection, destination: {
          self.content()
      }, label: {
          Label(title ?? "", systemImage: systemImage!)
      })
  }
}
