import SwiftUI

struct EventoFormView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: EventoViewModel
    let evento: Evento?

    @State private var titulo: String
    @State private var descricao: String
    @State private var dataHora: Date
    @State private var local: String

    init(viewModel: EventoViewModel, evento: Evento? = nil) {
        self.viewModel = viewModel
        self.evento = evento
        _titulo = State(initialValue: evento?.titulo ?? "")
        _descricao = State(initialValue: evento?.descricaoEvento ?? "")
        _dataHora = State(initialValue: evento?.dataHora ?? Date())
        _local = State(initialValue: evento?.local ?? "")
    }

    private var formularioValido: Bool {
        !titulo.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty &&
        !local.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Informações") {
                    TextField("Título", text: $titulo)
                    TextField("Local", text: $local)
                    DatePicker(
                        "Data e hora",
                        selection: $dataHora,
                        displayedComponents: [.date, .hourAndMinute]
                    )
                }

                Section("Descrição") {
                    TextField("Detalhes do evento", text: $descricao, axis: .vertical)
                        .lineLimit(4...8)
                }
            }
            .navigationTitle(evento == nil ? "Novo Evento" : "Editar Evento")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if viewModel.salvar(
                            evento: evento,
                            titulo: titulo,
                            descricao: descricao,
                            dataHora: dataHora,
                            local: local
                        ) {
                            dismiss()
                        }
                    }
                    .disabled(!formularioValido)
                }
            }
        }
    }
}
