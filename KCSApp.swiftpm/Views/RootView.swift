import SwiftUI

struct RootView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            VStack {
                CalendarView(year: 2021)
            }.tabItem { Label("カレンダー", systemImage: "calendar") }.tag(1)
        }
    }
}


