//
//  MarkdownViewer.swift
//  DMMD
//
//  Created by Pasquale Ambrosini on 21/06/2018.
//  Copyright © 2018 Pasquale Ambrosini. All rights reserved.
//

import Cocoa

class MarkdownViewer: NSWindowController {

    var markdown: Markdown? {
        didSet {
            guard let vc = self.contentViewController as? MarkdownViewerController else { return }
            vc.markdown = markdown
        }
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
    }

    static func presentWithURL(url: URL) {
        let path = url.path
        guard let md = Markdown(path: path) else { return }
        var windowController: MarkdownViewer!
        
        for w in NSApp.windows {
            guard let controller = w.contentViewController as? MarkdownViewerController else { continue }
            controller.markdown = md
            w.title = url.lastPathComponent
            return
        }
        
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "MarkdownViewer")) as! MarkdownViewer
        if var frame = windowController.window?.frame {
            let screenFrame = NSScreen.main?.visibleFrame
            frame = screenFrame ?? CGRect(x: 0, y: 0, width: 500, height: 500)
            windowController.window?.setFrame(frame, display: true)
            windowController.window?.title = url.lastPathComponent
        }
        
        windowController.showWindow(self)
        windowController.markdown = md
    }
}
