//
//  SwiftUIView.swift
//  
//
//  Created by 王楚江 on 2022/3/10.
//
import SwiftUI
import WebKit

#if os(OSX)
    import AppKit
    public typealias CustomView = NSView
#elseif os(iOS)
    import UIKit
    public typealias CustomView = UIView
#endif


// JS Func
typealias JavascriptCallback = (Result<Any?, Error>) -> Void
private struct JavascriptFunction {
    
    let functionString: String
    let callback: JavascriptCallback?
    
    init(functionString: String, callback: JavascriptCallback? = nil) {
        self.functionString = functionString
        self.callback = callback
    }
}

public class MarkdownWebView: CustomView, WKNavigationDelegate {
    @Environment(\.openURL) private var openURL
    private struct Constants {
        static let mdPreviewDidReady = "mdPreviewDidReady"
        static let mdPreviewDidChanged = "mdPreviewDidChanged"
    }
    private lazy var webview: WKWebView = {
        let preferences = WKPreferences()
        var userController = WKUserContentController()
        userController.add(self, name: Constants.mdPreviewDidReady) // Callback from Ace editor js
        userController.add(self, name: Constants.mdPreviewDidChanged)
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.userContentController = userController
        let webView = WKWebView(frame: bounds, configuration: configuration)
        webView.navigationDelegate = self
        
        #if os(OSX)
        webView.setValue(true, forKey: "drawsTransparentBackground") // Prevent white flick
        #elseif os(iOS)
        webView.isOpaque = false
        #endif
        
        return webView
    }()
    
    var textDidChanged: ((String) -> Void)?
    
    private var pageLoaded = false
    private var currentContent: String = ""
    private var pendingFunctions = [JavascriptFunction]()
    
    
    override init(frame frameRect: CGRect) {
        super.init(frame: frameRect)
        initWebView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initWebView()
    }
    
    func setContent(_ value: String) {
        
        guard currentContent != value else {
            return
        }
        
        currentContent = value
        //
        // It's tricky to pass FULL JSON or HTML text with \n or "", ... into JS Bridge
        // Have to wrap with `data_here`
        // And use String.raw to prevent escape some special string -> String will show exactly how it's
        // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals
        //
        let first = "var content = String.raw`"
        let content = """
        \(value)
        """.replacingOccurrences(of: "`", with: "\\`", options: .literal, range: nil)
            .replacingOccurrences(of: "{", with: "\\{", options: .literal, range: nil)
        
        let end = "`; markdownPreview(content.replace(/\\\\`/g, '`').replace(/\\\\{/g, '{'));"

        let script = first + content + end
        callJavascript(javascriptString: script)
        
    }
    func setTheme(_ theme: ColorScheme) {
        if theme == .dark {
            callJavascript(javascriptString: "document.body.classList.add('theme-dark');")
            callJavascript(javascriptString: "document.body.classList.remove('theme-light');")
        } else {
            callJavascript(javascriptString: "document.body.classList.remove('theme-dark');")
            callJavascript(javascriptString: "document.body.classList.add('theme-light');")
        }
    }
    func setPadding(_ padding: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.padding = '\(padding)px';")
    }
    func setPaddingTop(_ top: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingTop = '\(top)px';")
    }
    func setPaddingBottom(_ bottom: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingBottom = '\(bottom)px';")
    }
    func setPaddingLeft(_ left: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingLeft = '\(left)px';")
    }
    func setPaddingRight(_ right: Int) {
        callJavascript(javascriptString: "__markdown_preview__.style.paddingRight = '\(right)px';")
    }
    ///  open links in browsers
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            if url.isFileURL == false {
                openURL(url)
                decisionHandler(.cancel)
                return
            }
        }
        decisionHandler(.allow)
    }
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        /// Disable right-click menu
        webView.evaluateJavaScript("document.body.setAttribute('oncontextmenu', 'event.preventDefault();');", completionHandler: nil);
    }
}


extension MarkdownWebView {
    private func initWebView() {
        webview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(webview)
        webview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        webview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        webview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        webview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        guard let bundlePath = Bundle.module.path(forResource: "web", ofType: "bundle"),
            let bundle = Bundle(path: bundlePath),
            let indexPath = bundle.path(forResource: "index", ofType: "html") else {
                fatalError("Ace editor is missing")
        }
        
        let data = try! Data(contentsOf: URL(fileURLWithPath: indexPath))
        webview.load(data, mimeType: "text/html", characterEncodingName: "utf-8", baseURL: bundle.resourceURL!)
    }
    private func addFunction(function: JavascriptFunction) {
        pendingFunctions.append(function)
    }
    private func callJavascriptFunction(function: JavascriptFunction) {
        webview.evaluateJavaScript(function.functionString) { (response, error) in
            if let error = error {
                function.callback?(.failure(error))
            }
            else {
                function.callback?(.success(response))
            }
        }
    }
    private func callPendingFunctions() {
        for function in pendingFunctions {
            callJavascriptFunction(function: function)
        }
        pendingFunctions.removeAll()
    }
    private func callJavascript(javascriptString: String, callback: JavascriptCallback? = nil) {
        if pageLoaded {
            callJavascriptFunction(function: JavascriptFunction(functionString: javascriptString, callback: callback))
        }
        else {
            addFunction(function: JavascriptFunction(functionString: javascriptString, callback: callback))
        }
    }
}


// MARK: WKScriptMessageHandler

extension MarkdownWebView: WKScriptMessageHandler {

    public func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {

        // is Ready
        if message.name == Constants.mdPreviewDidReady {
            pageLoaded = true
            callPendingFunctions()
            return
        }
        
        // is Text change
        if message.name == Constants.mdPreviewDidChanged,
           let text = message.body as? String {
            
            self.textDidChanged?(text)

            return
        }
    }
}
