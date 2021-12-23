import SwiftUI

struct AddEventView: View {
    
    @State private var name: String = ""
    @State private var startAt: Date = Date()
    @State private var endAt: Date = Date().addingTimeInterval(24 * 60 * 60)
    @State private var isInterested: Bool = false
    @State private var isRepeat: Bool = false
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView { 
            ZStack {
                List {
                    listItem(
                        title: "イベント名",
                        view: TextField("入力", text: $name)
                    ).padding()
                    listItem(
                        title: "開始時刻",
                        view: DatePicker("選択", selection: $startAt) 
                    )
                    listItem(
                        title: "終了時刻",
                        view: DatePicker("選択", selection: $endAt) 
                    )
                    listItem(
                        title: "イベントに参加",
                        view: Toggle("参加予定", isOn: $isInterested)
                    )
                    listItem(
                        title: "繰り返し", 
                        view: Toggle("繰り返す", isOn: $isRepeat)
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
                }
            }
        }
    }
    
    func listItem<Content: View>(title: String, view: Content) -> some View {
        HStack {
            Text(title)
            Spacer()
            view
        }
    }
}
