import Foundation

protocol Documento {
    var id: UUID { get }
    func exibirDetalhes()
}
