import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @AppStorage("temaEscuro") private var temaEscuro = false
    @State private var viewModel = EventoViewModel()
    @State private var mostrarFormulario = false
    @State private var eventoSelecionado: Evento?

    var body: some View {
        @Bindable var viewModel = viewModel

        NavigationStack {
            Group {
                if viewModel.eventosFiltrados.isEmpty {
                    ContentUnavailableView(
                        viewModel.textoBusca.isEmpty ? "Nenhum evento" : "Nenhum resultado",
                        systemImage: "calendar.badge.plus",
                        description: Text(viewModel.textoBusca.isEmpty
                                          ? "Toque em + para cadastrar seu primeiro evento."
                                          : "Tente pesquisar outro título ou local.")
                    )
                } else {
                    List {
                        ForEach(viewModel.eventosFiltrados) { evento in
                            Button {
                                eventoSelecionado = evento
                            } label: {
                                EventoRowView(evento: evento)
                            }
                            .buttonStyle(.plain)
                        }
                        .onDelete(perform: viewModel.removerEventos)
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("Meus Eventos")
            .searchable(text: $viewModel.textoBusca, prompt: "Buscar título ou local")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        temaEscuro.toggle()
                    } label: {
                        Label(
                            temaEscuro ? "Usar tema claro" : "Usar tema escuro",
                            systemImage: temaEscuro ? "sun.max.fill" : "moon.fill"
                        )
                    }
                    .accessibilityHint("Alterna a aparência do aplicativo")
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        mostrarFormulario = true
                    } label: {
                        Label("Novo evento", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $mostrarFormulario) {
                EventoFormView(viewModel: viewModel)
            }
            .sheet(item: $eventoSelecionado) { evento in
                EventoFormView(viewModel: viewModel, evento: evento)
            }
            .alert("Atenção", isPresented: Binding(
                get: { viewModel.mensagemErro != nil },
                set: { if !$0 { viewModel.mensagemErro = nil } }
            )) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(viewModel.mensagemErro ?? "")
            }
            .task {
                viewModel.configurar(contexto: modelContext)
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Evento.self, inMemory: true)
}
