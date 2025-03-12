// Copyright © NextPixel. All rights reserved.

import SwiftUI

public struct PressedEffectButtonStyle: ButtonStyle {

    public init() {}
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
            .animation(.easeOut, value: configuration.isPressed)
            .contentShape(Rectangle())
    }
}
