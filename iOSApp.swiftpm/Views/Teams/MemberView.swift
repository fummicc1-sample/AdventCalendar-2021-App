import SwiftUI

struct MemberView: View {
    
    let isLeader: Bool
    let member: Member
    
    @State private var iconScale: Double = 1
    @State private var iconOpacity: Double = 0
    
    var body: some View {
        if let raw = member.imageUrl, let url = URL(string: raw) {
            AsyncImage(url: url, content: { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .clipShape(Circle())
                    .scaleEffect(iconScale)
                    .opacity(iconOpacity)
                    .onAppear {
                        withAnimation { 
                            iconScale = isLeader ? 1.25 : 1
                            iconOpacity = 1
                        }
                    }
            }, placeholder: { 
                ProgressView()
            })
        } else {
            EmptyView()
        }
    }
}
