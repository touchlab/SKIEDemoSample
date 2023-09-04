import SwiftUI
import shared
import AsyncExtensions

struct ChatRoomView: View {
    @StateObject
    private var viewModel = ChatRoomViewModel()

    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.messages, id: \.self) { message in
                        Text(message)
                            .padding(.horizontal)
                        Divider()
                    }
                }
            }
            Divider()
            HStack {
                TextField("Message", text: $viewModel.messageDraft)
                    .disabled(viewModel.isSending)
                    .textFieldStyle(.roundedBorder)
                if viewModel.isSending {
                    ProgressView()
                        .padding(.leading, 1)
                } else {
                    Button {
                        viewModel.sendDraft()
                    } label: {
                        Image(systemName: "paperplane")
                    }
                }
            }
            .padding()
            Divider()
        }
        .task {
            await viewModel.activate()
        }
    }
}

class ChatRoomViewModel: ObservableObject {
    let chatRoom = ChatRoom()

    @Published
    private(set) var messages: [String] = []

    @Published
    var messageDraft: String = ""

    @Published
    private(set) var isSending = false

    @MainActor
    func activate() async {
        for await messages in chatRoom.messages {
            self.messages = messages
        }
    }

    func sendDraft() {
        guard !messageDraft.isEmpty else { return }
        Task { @MainActor in
            defer {
                messageDraft = ""
                isSending = false
            }
            isSending = true

//            let task = Task {
//                try? await chatRoom.sendWithoutSKIE(
//                    message: messageDraft
//                )
//            }
//
//            task.cancel()
//
//            await task.value

            try? await chatRoom.send(message: messageDraft)
        }
    }
}
