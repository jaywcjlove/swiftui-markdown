//
//  KaTeXGroup.swift
//  Example
//
//  Created by 王楚江 on 2022/3/13.
//

import Markdown
import SwiftUI

struct KaTeXGroup: View {
    @State private var mdStr: String = """
        KaTeX
        ===
        
        ## Grammar
        
        ```markdown
        `KaTeX:a''`
        ```
        
        ```markdown
        \\\\`\\\\`\\\\`KaTeX
        ```
        
        ## Example
        
        `KaTeX:a'` `KaTeX:a''`  `KaTeX:\\widetilde{ac}`
        
        `KaTeX:( \\big( \\Big( \\bigg( \\Bigg(`

        ```katex
        c = \\pm\\sqrt{a^2 + b^2}
        ```
        
        ```katex
        \\widetilde{ac}
        \\underbrace{AB}
        ```
        
        ## [Accents](https://katex.org/docs/supported.html#accents)
        
        Source Code | Preview | Source Code | Preview |  Source Code | Preview
        ---- | ---- | ---- | ---- | ---- | ----
        `a'` | `KaTeX:a'` | `\\tilde{a}` | `KaTeX:\\tilde{a}` | `\\mathring{g}` | `KaTeX:\\mathring{g}`
        `a''` | `KaTeX:a''` | `\\widetilde{ac}` | `KaTeX:\\widetilde{ac}` | `\\overgroup{AB}` | `KaTeX:\\overgroup{AB}`
        `a^{\\prime}` | `KaTeX:a^{\\prime}` | `\\utilde{AB}` | `KaTeX:\\utilde{AB}` | `\\undergroup{AB}` | `KaTeX:\\undergroup{AB}`
        `\\acute{a}` | `KaTeX:\\acute{a}` | `\\vec{F}` | `KaTeX:\\vec{F}` | `\\Overrightarrow{AB}` | `KaTeX:\\Overrightarrow{AB}`
        `\\bar{y}` | `KaTeX:\\bar{y}` | `\\overleftarrow{AB}` | `KaTeX:\\overleftarrow{AB}` | `\\overrightarrow{AB}` | `KaTeX:\\overrightarrow{AB}`
        `\\breve{a}` | `KaTeX:\\breve{a}` | `\\underleftarrow{AB}` | `KaTeX:\\underleftarrow{AB}` | `\\underrightarrow{AB}` | `KaTeX:\\underrightarrow{AB}`
        `\\check{a}` | `KaTeX:\\check{a}` | `\\overleftharpoon{ac}` | `KaTeX:\\overleftharpoon{ac}` | `\\overrightharpoon{ac}` | `KaTeX:\\overrightharpoon{ac}`
        `\\dot{a}` | `KaTeX:\\dot{a}` | `\\overleftrightarrow{AB}` | `KaTeX:\\overleftrightarrow{AB}` | `\\overbrace{AB}` | `KaTeX:\\overbrace{AB}`
        `\\ddot{a}` | `KaTeX:\\ddot{a}` | `\\underleftrightarrow{AB}` | `KaTeX:\\underleftrightarrow{AB}` | `\\underbrace{AB}` | `KaTeX:\\underbrace{AB}`
        `\\grave{a}` | `KaTeX:\\grave{a}` | `\\overline{AB}` | `KaTeX:\\overline{AB}` | `\\overlinesegment{AB}` | `KaTeX:\\overlinesegment{AB}`
        `\\hat{\theta}` | `KaTeX:\\hat{\theta}` | `\\underline{AB}` | `KaTeX:\\underline{AB}` | `\\underlinesegment{AB}` | `KaTeX:\\underlinesegment{AB}`
        `\\widehat{ac}` | `KaTeX:\\widehat{ac}` | `\\widecheck{ac}` | `KaTeX:\\widecheck{ac}` | `\\underbar{X}` | `KaTeX:\\underbar{X}`
        
        
        **Accent functions inside \\text{…}**
        
        
        Source Code | Preview | Source Code | Preview |  Source Code | Preview | Source Code | Preview
        ---- | ---- | ---- | ---- | ---- | ---- | ---- | ----
        `\\'{a}` | `KaTeX:\\'{a}` | `\\~{a}` | `KaTeX:\\~{a}` | `\\.{a}` | `KaTeX:\\.{a}` | `\\H{a}` | `KaTeX:\\H{a}`
        ⚠️`-` | `-` | `\\={a}` | `KaTeX:\\={a}` | `\\"{a}` | `KaTeX:\\"{a}` | `\\v{a}` | `KaTeX:\\v{a}`
        `\\^{a}` | `KaTeX:\\^{a}` | `\\u{a}` | `KaTeX:\\u{a}` | `\\r{a}` | `KaTeX:\\r{a}`
        
        ## [Delimiters](https://katex.org/docs/supported.html#delimiters)
        
        Source Code | Preview | Source Code | Preview |  Source Code | Preview | Source Code | Preview | Source Code | Preview
        ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ----
        `( )` | `KaTeX:( )` | `\\lparen`, `\\rparen` | `KaTeX:\\lparen` `KaTeX:\\rparen` | `⌈ ⌉` | `KaTeX:⌈ ⌉` | `\\rceil`, `\\lceil` | `KaTeX:\\lceil` `KaTeX:\\rceil` | `\\uparrow` | `KaTeX:\\uparrow`
        `[ ]` | `KaTeX:[ ]` | `\\lbrack`, `\\rbrack` | `KaTeX:\\lbrack` `KaTeX:\\rbrack` | `⌊ ⌋` | `KaTeX:⌊ ⌋` | `\\lfloor`, `\\rfloor` | `KaTeX:\\lfloor` `KaTeX:\\rfloor` | `\\downarrow` |
        `\\{ \\}` | `KaTeX:\\{ \\}` | `\\lbrace`, `\\rbrace` | `KaTeX:\\lbrace` `KaTeX:\\rbrace` | `⎰⎱` | `KaTeX:⎰⎱` | `\\lmoustache`, `\\rmoustache` | `KaTeX:\\lmoustache` `KaTeX:\\rmoustache` | `\\updownarrow` | `KaTeX:\\updownarrow`
        `⟨ ⟩` | `KaTeX:⟨ ⟩` | `\\langle`, `\\rangle` | `KaTeX:\\langle` `KaTeX:\\rangle` | `⟮ ⟯` | `KaTeX:⟮ ⟯` | `\\lgroup`, `\\rgroup` | `KaTeX:\\lgroup` `KaTeX:\\rgroup` | `\\Uparrow` | `KaTeX:\\Uparrow` `KaTeX:\\downarrow`
        `\\|` | `KaTeX:\\|` | `\\vert` | `KaTeX:\\vert` | `┌ ┐` | `KaTeX:┌ ┐` | `\\ulcorner`, `\\urcorner` | `KaTeX:\\ulcorner` `KaTeX:\\urcorner` | `\\Downarrow` | `KaTeX:\\Downarrow`
        ⚠️`\\|` | ⚠️`KaTeX:\\|` | `\\Vert` | `KaTeX:\\Vert` | `└ ┘` | `KaTeX:└ ┘` | `\\llcorner`, `\\lrcorner` | `KaTeX:\\llcorner` `KaTeX:\\lrcorner` | `\\Updownarrow` | `KaTeX:\\Updownarrow`
        `\\lvert`, `\\rvert` | `KaTeX:\\lvert` `KaTeX:\\rvert` | `\\lVert`, `\\rVert` | `KaTeX:\\lVert` `KaTeX:\\rVert` | `\\left.` | `-` | `\\right.` | `-` | `\\backslash` | `KaTeX:\\backslash`
        `\\lang`, `\\rang` | `KaTeX:\\lang` `KaTeX:\\rang` | `\\lt \\gt` | `KaTeX:\\lt \\gt` | `⟦ ⟧` | `KaTeX:⟦ ⟧` | `\\llbracket`, `\\rrbracket` | `KaTeX:\\llbracket` `KaTeX:\\rrbracket` | `\\lBrace \\rBrace` | `KaTeX:\\lBrace \\rBrace`
        
        **Delimiter Sizing**
        
        `KaTeX:\\left(\\LARGE{AB}\\right)`
        
        `KaTeX:( \\big( \\Big( \\bigg( \\Bigg(`
        
        | Code | Code | Code | Code | Code |
        | ---- | ---- | ---- | ---- | ---- |
        | `\\left` | `\\big` | `\\bigl` | `\\bigm` | `\\bigr` |
        | `\\middle` | `\\Big` | `\\Bigl` | `\\Bigm` | `\\Bigr` |
        | `\\right` | `\\bigg` | `\\biggl` | `\\biggm` | `\\biggr` |
        |  - | `\\Bigg` | `\\Biggl` | `\\Biggm` | `\\Biggr` |
        
        """
    var body: some View {
        Markdown(content: $mdStr)
    }
}
