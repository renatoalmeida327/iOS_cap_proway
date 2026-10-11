import Foundation

final class LivroDigital: Livro {
    private(set) var tamanhoEmMB: Double

    init(
        id: UUID = UUID(),
        titulo: String,
        autor: String,
        anoPublicacao: Int,
        isEmprestado: Bool = false,
        tamanhoEmMB: Double
    ) {
        self.tamanhoEmMB = tamanhoEmMB
        super.init(
            id: id,
            titulo: titulo,
            autor: autor,
            anoPublicacao: anoPublicacao,
            isEmprestado: isEmprestado
        )
    }

    func atualizarTamanho(_ novoTamanho: Double) {
        tamanhoEmMB = novoTamanho
    }

    override func exibirDetalhes() {
        super.exibirDetalhes()
        print(String(format: "Tamanho do arquivo: %.2f MB", tamanhoEmMB))
    }
}
