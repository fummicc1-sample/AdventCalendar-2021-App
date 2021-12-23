import SwiftUI
import Core

struct AddEventView: View {

    @ObservedObject var viewModel: AddEventViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView { 
            ZStack {
                List {
                    ListItemView(
                        title: "イベント名",
                        content: TextField("入力", text: $viewModel.name)
                    ).padding()
                    ListItemView(
                        title: "開始時刻",
                        content: DatePicker("選択", selection: $viewModel.startAt)
                    )
                    ListItemView(
                        title: "終了時刻",
                        content: DatePicker("選択", selection: $viewModel.endAt)
                    )
                    ListItemView(
                        title: "イベントに参加",
                        content: Toggle("", isOn: $viewModel.isInterested)
                    )
                    ListItemView(
                        title: "繰り返し", 
                        content: Toggle("", isOn: $viewModel.isRepeat)
                    )
                }
            }
            .navigationTitle("新しいイベントの作成")
            .toolbar {
                Button {
                    Task {
                        await viewModel.save()
                    }
                } label: {
                    Text("決定").bold()
                }

            }
        }
    }
}
