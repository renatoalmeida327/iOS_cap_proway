import Foundation

final class Biblioteca {
    private var livros: [Livro] = []

    func cadastrar(_ livro: Livro) -> Bool {
        guard buscarPorID(livro.id) == nil else { return false }
        livros.append(livro)
        return true
    }

    func listarTodos() {
        guard !livros.isEmpty else {
            print("\nNenhum livro cadastrado.")
            return
        }

        print("\n=== LIVROS CADASTRADOS (\(livros.count)) ===")
        livros.forEach { $0.exibirDetalhes() }
        print("----------------------------------------")
    }

    func buscarPorID(_ id: UUID) -> Livro? {
        livros.first { $0.id == id }
    }

    func buscarPorTitulo(_ trecho: String) -> [Livro] {
        let consulta = trecho.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !consulta.isEmpty else { return [] }

        return livros.filter {
            $0.titulo.range(of: consulta, options: [.caseInsensitive, .diacriticInsensitive]) != nil
        }
    }

    @discardableResult
    func remover(id: UUID) -> Bool {
        guard let indice = livros.firstIndex(where: { $0.id == id }) else {
            return false
        }
        livros.remove(at: indice)
        return true
    }
}
