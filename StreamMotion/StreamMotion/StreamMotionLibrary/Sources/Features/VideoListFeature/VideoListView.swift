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
    
    @ObservedObject private var viewModel: VideoListViewModel
    @State private var isPresented = false
    
    public init(viewModel: VideoListViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Group {
            switch viewModel.state {
                case .loading:
                    SpinnerView()
                        .frame(width: 40, height: 40)
                case .success(let rows):
                    List {
                        Group {
                            ForEach(rows) { row in
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
                    .sheet(isPresented: $isPresented) {
                        VideoPlayerView()
                    }
                case .failure:
                    failureView
            }
        }
        .navigationTitle("Dailymotion")
        .taskOnce {
            await viewModel.fetchVideos()
        }
    }
}

// MARK: - Private functions

private extension VideoListView {
    
    @ViewBuilder
    var failureView: some View {
        VStack {
            Text("Une erreur est survenue. Merci de réessayer")
                .font(.headline)
            Button {
                Task {
                    await viewModel.fetchVideos()
                }
            } label: {
                Text("Réessayer")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background {
                RoundedRectangle(cornerRadius: 25)
                    .fill(.black)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
