import SwiftUI

public struct PlaylistItemView: View {

    public init(
        title: String,
        thumbnail: URL,
        description: String,
        publishedAt: String
    ) {
        self.title = title
        self.thumbnail = thumbnail
        self.description = description
        self.publishedAt = publishedAt
    }

    public let title: String
    public let thumbnail: URL
    public let description: String
    public let publishedAt: String

    public var body: some View {
        VStack {
            AsyncImage(url: thumbnail) { phase in
                switch phase {
                case .success(let image):
                    image.resizable()
                default:
                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
            .frame(height: 160)
            Text(title)
            
        }
    }
}

struct PlaylistItemView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistItemView(
            title: "",
            thumbnail: URL(string: "fummicc1.dev")!,
            description: "",
            publishedAt: ""
        )
    }
}
