//
//  Extensions.swift
//  DMMD
//
//  Created by Pasquale Ambrosini on 22/06/2018.
//  Copyright © 2018 Pasquale Ambrosini. All rights reserved.
//

import Foundation
import Cocoa

extension NSOpenPanel {
    var selectUrl: URL? {
        title = "Select Image"
        allowsMultipleSelection = false
        canChooseDirectories = false
        canChooseFiles = true
        canCreateDirectories = false
        allowedFileTypes = ["md"]  // to allow only images, just comment out this line to allow any file type to be selected
        return runModal() == .OK ? urls.first : nil
    }
}
