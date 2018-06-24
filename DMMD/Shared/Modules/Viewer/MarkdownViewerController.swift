//
//  MarkdownViewerController.swift
//  DMMD
//
//  Created by Pasquale Ambrosini on 22/06/2018.
//  Copyright © 2018 Pasquale Ambrosini. All rights reserved.
//

import Cocoa
import WebKit

class MarkdownViewerController: NSViewController {

    var markdown: Markdown? {
        didSet { self.updateContent() }
    }
    //@IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var webView: WebView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateContent() {
        if let markdown = self.markdown?.html {
            let indexURL = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Template")!
            var template = try! String(contentsOf: indexURL)
            template = template.replacingOccurrences(of: "$PLACEHOLDER", with: markdown)
            self.loadWebView(html: template)
        }
    }
    
    func loadWebView(html: String) {
        let url = Bundle.main.url(forResource: "sample", withExtension: "md", subdirectory: "Template")!
        self.webView.mainFrame.loadHTMLString(html, baseURL: url)
    }
}
