//
//  TaskOnce.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import SwiftUI

public extension View {

    func taskOnce(_ action: @escaping () async -> Void) -> some View {
        modifier(TaskOnce(action: action))
    }
}

private struct TaskOnce: ViewModifier {

    let action: () async -> Void

    @State private var taskExecuted = false

    func body(content: Content) -> some View {
        content.task {
            guard !taskExecuted else { return }

            taskExecuted = true
            await action()
        }
    }
}
