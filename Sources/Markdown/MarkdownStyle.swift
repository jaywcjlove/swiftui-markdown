//
//  SwiftUIView.swift
//  
//
//  Created by 王楚江 on 2022/3/11.
//

import SwiftUI

public struct MarkdownStyle: Hashable {
    public var padding: Int?
    public var paddingTop: Int?
    public var paddingRight: Int?
    public var paddingLeft: Int?
    public var paddingBottom: Int?
    public init(padding: Int = 18) {
        self.padding = padding
    }
    public init(paddingTop: Int = 18, paddingBottom: Int = 18, paddingLeft: Int = 18, paddingRight: Int = 18) {
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
    }
    public init(padding: Int = 18, paddingTop: Int = 18, paddingBottom: Int = 18, paddingLeft: Int = 18, paddingRight: Int = 18) {
        self.padding = padding
        self.paddingTop = paddingTop
        self.paddingBottom = paddingBottom
        self.paddingLeft = paddingLeft
        self.paddingRight = paddingRight
    }
}
