import SwiftUI
import Core

struct AddEventView: View {
    
    @State private var name: String = ""
    @State private var startAt: Date = Date()
    @State private var endAt: Date = Date().addingTimeInterval(24 * 60 * 60)
    @State private var isInterested: Bool = false
    @State private var isRepeat: Bool = false
    @EnvironmentObject var store: Store
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView { 
            ZStack {
                List {
                    ListItemView(
                        title: "イベント名",
                        content: TextField("入力", text: $name)
                    ).padding()
                    ListItemView(
                        title: "開始時刻",
                        content: DatePicker("選択", selection: $startAt) 
                    )
                    ListItemView(
                        title: "終了時刻",
                        content: DatePicker("選択", selection: $endAt) 
                    )
                    ListItemView(
                        title: "イベントに参加",
                        content: Toggle("", isOn: $isInterested)
                    )
                    ListItemView(
                        title: "繰り返し", 
                        content: Toggle("", isOn: $isRepeat)
                    )
                }
            }
            .navigationTitle("新しいイベントの作成")
            .toolbar { 
                let me = store.me!
                let members: [Member] = isInterested ? [me] : []
                let repeatType: Event.Repeat? = isRepeat ? .everyWeek : nil
                Button("決定") {
                    let event = Event(
                        id: -1,
                        name: name,
                        startAt: startAt,
                        endAt: endAt,
                        interested: members, 
                        repeatType: repeatType
                    )
                    Task {
                        await store.persist(event: event)
                        await MainActor.run {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
