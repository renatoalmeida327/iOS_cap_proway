import Foundation
import SwiftData

@Model
final class Evento {
    var titulo: String
    var descricaoEvento: String
    var dataHora: Date
    var local: String

    init(titulo: String, descricaoEvento: String, dataHora: Date, local: String) {
        self.titulo = titulo
        self.descricaoEvento = descricaoEvento
        self.dataHora = dataHora
        self.local = local
    }
}
