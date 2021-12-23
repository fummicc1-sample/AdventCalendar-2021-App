import SwiftUI

struct ListItemView<Content: View>: View {

    let title: String
    let content: Content

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            content
        }
    }
}
