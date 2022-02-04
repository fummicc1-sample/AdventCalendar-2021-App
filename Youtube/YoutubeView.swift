import Core
import Combine
import SwiftUI
import YouTubeiOSPlayerHelper

public enum YoutubeView {

    public struct VideoView: UIViewRepresentable {

        @Binding public var video: Core.Video
        @Binding public var action: Action?

        public init(video: Binding<Core.Video>, action: Binding<Action?>) {
            self._video = video
            self._action = action
        }

        public func makeUIView(context: Context) -> YTPlayerView {
            let view = YTPlayerView()
            let ok = view.load(withVideoId: video.id.value)
            if ok {
                context.coordinator.latestVideoId = video.id.value
            }
            return view
        }

        public func makeCoordinator() -> Coordinator {
            Coordinator()
        }

        public func updateUIView(_ uiView: YTPlayerView, context: Context) {

            if let latestId = context.coordinator.latestVideoId {
                if video.id.value != latestId {
                    uiView.load(withVideoId: video.id.value)
                }
            }

            guard let action = action else {
                return
            }
            switch action {
            case .resume:
                uiView.playVideo()
            case .pause:
                uiView.pauseVideo()
            case .stop:
                uiView.stopVideo()
            case .next:
                uiView.nextVideo()
            case .back:
                uiView.previousVideo()
            }
            self.action = nil
        }
    }

    public struct PlaylistView: UIViewRepresentable {

        @Binding public var playlist: Core.Playlist

        public func makeUIView(context: Context) -> YTPlayerView {
            let view = YTPlayerView()
            view.load(withPlaylistId: playlist.id.value)
            return view
        }

        public func makeCoordinator() -> Coordinator {
            Coordinator()
        }

        public func updateUIView(_ uiView: YTPlayerView, context: Context) {
            uiView.load(withPlaylistId: playlist.id.value)
        }
    }
}

public extension YoutubeView.VideoView {
    class Coordinator: ObservableObject {
        var latestVideoId: String?
    }
}

public extension YoutubeView.PlaylistView {
    class Coordinator {
        var latestPlaylistId: String?
    }
}

public extension YoutubeView {
    enum Action {
        case resume
        case pause
        case stop

        case next
        case back
    }
}
