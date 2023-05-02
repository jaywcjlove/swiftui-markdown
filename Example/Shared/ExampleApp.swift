//
//  ExampleApp.swift
//  Shared
//
//  Created by 王楚江 on 2022/3/10.
//

import SwiftUI

@main
struct ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            #if os(macOS)
              DemoList()
                .frame(
                  minWidth: 100,
                  idealWidth: 300,
                  maxWidth: .infinity,
                  minHeight: 100,
                  idealHeight: 200,
                  maxHeight: .infinity
                        
                )
            #else
              DemoList()
            #endif
        }
        #if os(macOS)
        .windowToolbarStyle(UnifiedCompactWindowToolbarStyle())
        .windowStyle(HiddenTitleBarWindowStyle())
        #endif
    }
}
