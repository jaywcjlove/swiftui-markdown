//
//  DemoList.swift
//  Example
//
//  Created by 王楚江 on 2022/3/11.
//

import SwiftUI

struct DemoList: View {
    @State private var selection: String? = "Home"
    var body: some View {
        NavigationView {
            #if os(macOS)
            self.list.listStyle(.sidebar)
                .listStyle(SidebarListStyle())
            #else
            self.list.navigationTitle("Markdown Preview")
            #endif
        }
        .toolbar {
            Text("\(selection ?? "Company Inc")")
            Spacer()
            #if os(macOS)
            Button(action: {
                NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
            }, label: {
                Image(systemName: "sidebar.left")
                    .resizable() // 它将调整大小，以便填充所有可用空间
                    .aspectRatio(contentMode: .fit)
                    .font(.system(size: 18))
            })
            #endif
        }
    }
    private var list: some View {
        List {
            DemoRow(title: "Home", systemImage: "house.fill", tag: "Home", selection: $selection) {
                HomeGroup()
            }
            DemoRow(title: "Base Markdown", systemImage: "doc.text.image", tag: "Base Markdown", selection: $selection) {
                BaseMarkdownGroup()
            }
            DemoRow(title: "Code Block", systemImage: "chevron.left.forwardslash.chevron.right", tag: "Code Block", selection: $selection) {
                CodeGroup()
            }
            DemoRow(title: "ToDo", systemImage: "chevron.left.forwardslash.chevron.right", tag: "ToDo", selection: $selection) {
                ToDoGroup()
            }
        }
    }
}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList()
    }
}
