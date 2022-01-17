import Foundation
import YouTubeiOSPlayerHelper
import SwiftUI
import Core

public struct YoutubeView: UIViewRepresentable {

    public let size: CGSize
    @Binding public var video: Video
    @State private var currentVideo: Video?

    public func makeUIView(context: Context) -> YTPlayerView {
        let view = YTPlayerView(frame: CGRect(origin: .zero, size: size))
        view.delegate = context.coordinator
        view.load(withVideoId: video.id)
        currentVideo = video
        return view
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    public func updateUIView(_ uiView: YTPlayerView, context: Context) {
        if let currentVideo = currentVideo, currentVideo.id == video.id {
            return
        }
        uiView.load(withVideoId: video.id)
        currentVideo = video
    }

    public class Coordinator: NSObject, YTPlayerViewDelegate {

    }
}
