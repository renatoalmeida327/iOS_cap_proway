import Foundation
import Observation
import SwiftData

@Observable
final class EventoViewModel {
    var eventos: [Evento] = []
    var textoBusca = ""
    var mensagemErro: String?

    private var modelContext: ModelContext?

    var eventosFiltrados: [Evento] {
        let busca = textoBusca.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !busca.isEmpty else { return eventos }

        return eventos.filter {
            $0.titulo.localizedCaseInsensitiveContains(busca) ||
            $0.local.localizedCaseInsensitiveContains(busca)
        }
    }

    func configurar(contexto: ModelContext) {
        guard modelContext == nil else { return }
        modelContext = contexto
        buscarEventos()
    }

    func buscarEventos() {
        guard let modelContext else { return }
        let descriptor = FetchDescriptor<Evento>(
            sortBy: [SortDescriptor(\Evento.dataHora, order: .forward)]
        )

        do {
            eventos = try modelContext.fetch(descriptor)
            mensagemErro = nil
        } catch {
            mensagemErro = "Não foi possível carregar os eventos."
        }
    }

    @discardableResult
    func salvar(
        evento: Evento? = nil,
        titulo: String,
        descricao: String,
        dataHora: Date,
        local: String
    ) -> Bool {
        let tituloLimpo = titulo.trimmingCharacters(in: .whitespacesAndNewlines)
        let localLimpo = local.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !tituloLimpo.isEmpty, !localLimpo.isEmpty else {
            mensagemErro = "Preencha o título e o local."
            return false
        }
        guard let modelContext else {
            mensagemErro = "O armazenamento ainda não está disponível."
            return false
        }

        if let evento {
            evento.titulo = tituloLimpo
            evento.descricaoEvento = descricao.trimmingCharacters(in: .whitespacesAndNewlines)
            evento.dataHora = dataHora
            evento.local = localLimpo
        } else {
            let novoEvento = Evento(
                titulo: tituloLimpo,
                descricaoEvento: descricao.trimmingCharacters(in: .whitespacesAndNewlines),
                dataHora: dataHora,
                local: localLimpo
            )
            modelContext.insert(novoEvento)
        }

        return persistirAlteracoes()
    }

    func remover(_ evento: Evento) {
        guard let modelContext else { return }
        modelContext.delete(evento)
        _ = persistirAlteracoes()
    }

    func removerEventos(nos offsets: IndexSet) {
        for indice in offsets {
            remover(eventosFiltrados[indice])
        }
    }

    private func persistirAlteracoes() -> Bool {
        guard let modelContext else { return false }
        do {
            try modelContext.save()
            buscarEventos()
            mensagemErro = nil
            return true
        } catch {
            mensagemErro = "Não foi possível salvar as alterações."
            return false
        }
    }
}
