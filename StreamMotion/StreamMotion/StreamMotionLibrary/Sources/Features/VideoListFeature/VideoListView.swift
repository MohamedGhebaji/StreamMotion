//
//  VideoListView.swift
//  StreamMotionLibrary
//
//  Created by Mohamed Ghebaji on 08/03/2025.
//

import SwiftUI

import Utils
import UI
import VideoPlayerFeature

public struct VideoListView: View {
    
    @StateObject private var viewModel: VideoListViewModel
    @State private var isPresented = false
    
    public init(viewModel: VideoListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        Group {
            if viewModel.rows.isEmpty {
                SpinnerView()
                    .frame(width: 40, height: 40)
            } else {
                List {
                    Group {
                        ForEach(viewModel.rows) { row in
                            VideoRowView(state: row)
                                .onTapGesture {
                                    isPresented.toggle()
                                }
                        }
                        
                        if viewModel.canLoadMore {
                            SpinnerView()
                                .frame(width: 40, height: 40)
                                .frame(maxWidth: .infinity)
                                .task {
                                    await viewModel.loadNextPage()
                                }
                        }
                    }
                    .listSectionSeparator(.hidden, edges: [.top, .bottom])
                }
                .listStyle(.plain)
                .fullScreenCover(isPresented: $isPresented) {
                    VideoPlayerView()
                }
            }
        }
        .navigationTitle("Dailymotion")
        .taskOnce {
            await viewModel.fetchVideos()
        }
    }
}
