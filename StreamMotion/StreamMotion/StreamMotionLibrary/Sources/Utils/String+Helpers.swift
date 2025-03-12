// Copyright © StreamMotion. All rights reserved.

import Foundation

public extension String {
    
    func toAttributedStringFromHTML() -> AttributedString? {
        guard let data = self.data(using: .utf16) else { return nil }
        guard let attributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ],
            documentAttributes: nil
        ) else { return nil }
        
        return AttributedString(attributedString)
    }
}
