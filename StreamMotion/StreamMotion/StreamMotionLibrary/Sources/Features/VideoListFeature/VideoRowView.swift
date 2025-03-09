//
//  VideoRowView.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import SwiftUI

import Domain
import UI

struct VideoRowState: Equatable, Identifiable {
    
    let id: String
    let thumbnailUrl: String
    let title: String
    let description: String
    let timeAgo: String
}

struct VideoRowView: View {
    
    let state: VideoRowState
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                AsyncImage(url: URL(string: state.thumbnailUrl)) { image in
                    image.resizable()
                } placeholder: {
                    SpinnerView()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 120, height: 60)
                
                Text(state.title)
                    .font(.headline)
            }
            
            Text(state.description)
                .font(.subheadline)
            
            Text(state.timeAgo)
                .font(.caption)
        }
        .padding()
    }
}
