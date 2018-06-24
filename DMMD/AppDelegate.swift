//
//  AppDelegate.swift
//  DMMD
//
//  Created by Pasquale Ambrosini on 21/06/2018.
//  Copyright © 2018 Pasquale Ambrosini. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func openDocument(_ sender: NSMenuItem) {
        if let url = NSOpenPanel().selectUrl {
            MarkdownViewer.presentWithURL(url: url)
        } else {
            print("file selection was canceled")
        }
    }
    
    @IBAction func printWebView(_ sender: NSMenuItem) {
        let windows = NSApp.windows
        guard let window = windows.first else { return }
        guard let controller = window.contentViewController as? MarkdownViewerController else { return }
        let op = NSPrintOperation(view: controller.webView.mainFrame.frameView.documentView)
        op.run()
        op.runModal(for: window, delegate: nil, didRun: nil, contextInfo: nil)
    }
}

