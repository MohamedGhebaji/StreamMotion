// Copyright © StreamMotion. All rights reserved.

import SwiftUI

import Domain
import DesignSystem

struct VideoRowState: Equatable, Identifiable {
    
    let id: String
    let thumbnailUrl: String
    let title: String
    let description: AttributedString?
    let timeAgo: String
}

struct VideoRowView: View {
    
    let state: VideoRowState
    
    var body: some View {
        SMVStack(alignment: .leading, spacing: .medium2) {
            SMHStack(alignment: .top, spacing: .small2) {
                AsyncImage(url: URL(string: state.thumbnailUrl)) { image in
                    image
                        .resizable()
                        .cornerRadius(8)
                } placeholder: {
                    SpinnerView()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 120, height: 60)
                
                SMText(state.title, style: .titleSmall, color: AppAsset.Colors.appBlack.swiftUIColor)
            }
            if let description = state.description {
                SMText(description, style: .buttonMedium, color: AppAsset.Colors.appBlack.swiftUIColor)
            }
            SMText(state.timeAgo, style: .textSmall, color: AppAsset.Colors.appBlack.swiftUIColor)
        }
        .padding()
    }
}
