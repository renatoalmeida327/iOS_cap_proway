import SwiftUI
import SwiftData

@main
struct GerenciadorEventosApp: App {
    @AppStorage("temaEscuro") private var temaEscuro = false

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(temaEscuro ? .dark : .light)
        }
        .modelContainer(for: Evento.self)
    }
}
