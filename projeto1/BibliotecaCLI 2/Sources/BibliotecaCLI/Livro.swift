import Foundation

class Livro: Documento {
    let id: UUID
    private(set) var titulo: String
    private(set) var autor: String
    private(set) var anoPublicacao: Int
    private(set) var isEmprestado: Bool

    init(
        id: UUID = UUID(),
        titulo: String,
        autor: String,
        anoPublicacao: Int,
        isEmprestado: Bool = false
    ) {
        self.id = id
        self.titulo = titulo
        self.autor = autor
        self.anoPublicacao = anoPublicacao
        self.isEmprestado = isEmprestado
    }

    func editar(titulo: String, autor: String, anoPublicacao: Int) {
        self.titulo = titulo
        self.autor = autor
        self.anoPublicacao = anoPublicacao
    }

    @discardableResult
    func emprestar() -> Bool {
        guard !isEmprestado else { return false }
        isEmprestado = true
        return true
    }

    @discardableResult
    func devolver() -> Bool {
        guard isEmprestado else { return false }
        isEmprestado = false
        return true
    }

    func exibirDetalhes() {
        let status = isEmprestado ? "Emprestado" : "Disponível"
        print("""
        ----------------------------------------
        ID: \(id.uuidString)
        Título: \(titulo)
        Autor: \(autor)
        Ano de publicação: \(anoPublicacao)
        Status: \(status)
        """)
    }
}
