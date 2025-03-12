// Copyright © StreamMotion. All rights reserved.

import SwiftUI

public struct SMText: View {

    // MARK: - Constant

    private enum Constant {
        static let disabledOpacity: CGFloat = 0.4
    }

    // MARK: - Var

    private let text: Text
    private let style: SMTextStyle
    private let color: Color

    // MARK: - Init

    public init(_ text: Text, style: SMTextStyle, color: Color) {
        self.text = text
        self.style = style
        self.color = color
    }

    public init<S>(_ text: S, style: SMTextStyle, color: Color) where S: StringProtocol {
        self.text = Text(text)
        self.style = style
        self.color = color
    }
    
    public init(
        _ attributedContent: AttributedString,
        style: SMTextStyle,
        color: Color,
        underlined: Bool = false
    ) {
        self.text = underlined ? Text(attributedContent).underline() : Text(attributedContent)
        self.style = style
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        text
            .multilineTextAlignment(.leading)
            .foregroundColor(color)
            .font(style.font)
    }
}
