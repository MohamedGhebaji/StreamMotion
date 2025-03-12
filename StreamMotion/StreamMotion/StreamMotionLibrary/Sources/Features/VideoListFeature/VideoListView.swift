// Copyright © StreamMotion. All rights reserved.

import SwiftUI

import Utils
import DesignSystem
import Router

public struct VideoListView: View {
    
    @StateObject private var viewModel: VideoListViewModel
    @State private var isPresented = false
    @EnvironmentObject private var routeurPath: RouterPath

    public init(viewModel: VideoListViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    public var body: some View {
        Group {
            switch viewModel.videoListState {
                case .loading:
                    SpinnerView()
                        .frame(width: 40, height: 40)
                case .success(let rows):
                    List {
                        Group {
                            ForEach(rows) { row in
                                Button {
                                    routeurPath.presentedSheet = .player
                                } label: {
                                    VideoRowView(state: row)
                                }
                                .buttonStyle(PressedEffectButtonStyle())
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
