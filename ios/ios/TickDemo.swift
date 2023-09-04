import SwiftUI
import shared
import AsyncExtensions

struct TickView: View {
    @StateObject
    private var viewModel = TickDemoViewModel()

    var body: some View {
        Text(viewModel.message)
            .task {
                await viewModel.activate()
            }
    }
}

class TickDemoViewModel: ObservableObject {
    @Published
    private(set) var message: String = "Loading ..."

    @MainActor
    func activate() async {
        let secondCounter = TickProvider.shared.ticks()
            .scan(0) { acc, _ in
                acc + 1
            }

        for await tick in secondCounter {
            message = "Tick: \(tick)"
        }
    }
}
