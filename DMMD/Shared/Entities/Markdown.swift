//
//  MDDocument.swift
//  DMMD
//
//  Created by Pasquale Ambrosini on 21/06/2018.
//  Copyright © 2018 Pasquale Ambrosini. All rights reserved.
//

import Foundation
import SwiftMark

struct Markdown {
    var markdown: String
    
    init?(markdown: String) {
        self.markdown = markdown
    }
    
    init?(path: String) {
        guard FileManager.default.fileExists(atPath: path) else { return nil }
        guard path.suffix(2) == "md" else { return nil }
        guard let content = try? String(contentsOfFile: path, encoding: .utf8) else { return nil }
        self.markdown = content
    }
}

extension Markdown {
    
    fileprivate static func isValid(markdown: String) -> Bool {
        return true
    }
    
    var html: String? {
        return try? commonMarkToHTML(self.markdown)
    }
    
    func html(completion: @escaping (_ html: String?)->()) {
        DispatchQueue.global(qos: .userInitiated).async {
            let result = self.html
            completion(result)
        }
    }
}
