import Foundation

struct Console {
    static func lerTexto(_ mensagem: String, permitirVazio: Bool = false) -> String {
        while true {
            print(mensagem, terminator: "")
            guard let entrada = readLine() else {
                print("Entrada encerrada. Finalizando o programa.")
                exit(0)
            }

            let texto = entrada.trimmingCharacters(in: .whitespacesAndNewlines)
            if permitirVazio || !texto.isEmpty {
                return texto
            }
            print("Valor inválido. Digite um texto não vazio.")
        }
    }

    static func lerInt(_ mensagem: String, intervalo: ClosedRange<Int>? = nil) -> Int {
        while true {
            let texto = lerTexto(mensagem)
            if let valor = Int(texto), intervalo?.contains(valor) ?? true {
                return valor
            }
            print("Número inválido. Tente novamente.")
        }
    }

    static func lerDoublePositivo(_ mensagem: String) -> Double {
        while true {
            let texto = lerTexto(mensagem).replacingOccurrences(of: ",", with: ".")
            if let valor = Double(texto), valor > 0 {
                return valor
            }
            print("Valor inválido. Informe um número maior que zero.")
        }
    }

    static func lerUUID(_ mensagem: String) -> UUID {
        while true {
            let texto = lerTexto(mensagem)
            if let id = UUID(uuidString: texto) {
                return id
            }
            print("UUID inválido. Copie o ID completo exibido na listagem.")
        }
    }

    static func lerSimNao(_ mensagem: String) -> Bool {
        while true {
            let resposta = lerTexto(mensagem).lowercased()
            if ["s", "sim"].contains(resposta) { return true }
            if ["n", "nao", "não"].contains(resposta) { return false }
            print("Digite S para sim ou N para não.")
        }
    }
}
