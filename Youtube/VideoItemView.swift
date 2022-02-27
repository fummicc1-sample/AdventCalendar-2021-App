import SwiftUI
import Core

public struct VideoItemView: View {

    public init(
        namespace: Namespace.ID,
        alignment: Alignment = .center,
        id: VideoId,
        title: String,
        thumbnail: URL,
        avatar: URL,
        channel: String,
        publishedAt: String,
        viewCount: Int? = nil
    ) {
        self.namespace = namespace
        self.alignment = alignment
        self.videoId = id
        self.title = title
        self.thumbnail = thumbnail
        self.avatar = avatar
        self.channel = channel
        self.publishedAt = publishedAt
        self.viewCount = viewCount
    }

    public var namespace: Namespace.ID
    public let alignment: Alignment

    public let videoId: VideoId
    public let title: String
    public let thumbnail: URL
    public let avatar: URL
    public let channel: String
    public let publishedAt: String
    public let viewCount: Int?

    public var body: some View {
        VStack {
            AsyncImage(
                url: thumbnail,
                content: { phase in
                    switch phase {
                    case .success(let image):
                        image.resizable()
                    default:
                        ProgressView()
                            .progressViewStyle(.circular)
                    }
                }
            )
                .matchedGeometryEffect(id: videoId, in: namespace)
                .frame(height: 160)
                .animation(.easeInOut, value: videoId)
                .scaleEffect()
            Spacer()
                .frame(height: 4)
            HStack {
                AsyncImage(
                    url: avatar,
                    content: { phase in
                        switch phase {
                        case .success(let image):
                            image.resizable()
                                .frame(width: 40, height: 40)
                        default:
                            ProgressView()
                                .progressViewStyle(.circular)
                        }
                    }
                )
                    .aspectRatio(1, contentMode: .fit)
                VStack {
                    Text(title)
                        .font(.title3)
                        .bold()
                    Spacer()
                        .frame(height: 8)
                    Text(channel)
                        .foregroundColor(.secondary)
                    HStack {
                        if let viewCount = viewCount {
                            Text("\(viewCount)")
                            Text("・")
                        }
                        Text(publishedAt)
                    }
                }
            }
        }
    }
}
