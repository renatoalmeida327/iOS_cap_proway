import Foundation

let biblioteca = Biblioteca()
var executando = true

func exibirMenu() {
    print("""

    ========================================
       SISTEMA DE GERENCIAMENTO DE BIBLIOTECA
    ========================================
    1. Cadastrar livro
    2. Listar todos os livros
    3. Buscar livro por ID
    4. Buscar livro por título
    5. Editar livro
    6. Emprestar livro
    7. Devolver livro
    8. Remover livro
    0. Sair
    ----------------------------------------
    """)
}

func cadastrarLivro() {
    print("\n=== CADASTRO DE LIVRO ===")
    let titulo = Console.lerTexto("Título: ")
    let autor = Console.lerTexto("Autor: ")
    let ano = Console.lerInt("Ano de publicação: ", intervalo: 1...Calendar.current.component(.year, from: Date()))
    let digital = Console.lerSimNao("É um livro digital? (S/N): ")

    let livro: Livro
    if digital {
        let tamanho = Console.lerDoublePositivo("Tamanho em MB: ")
        livro = LivroDigital(titulo: titulo, autor: autor, anoPublicacao: ano, tamanhoEmMB: tamanho)
    } else {
        livro = Livro(titulo: titulo, autor: autor, anoPublicacao: ano)
    }

    if biblioteca.cadastrar(livro) {
        print("Livro cadastrado com sucesso!")
        print("ID gerado: \(livro.id.uuidString)")
    } else {
        print("Não foi possível cadastrar: ID duplicado.")
    }
}

func buscarLivroPorID() -> Livro? {
    let id = Console.lerUUID("Informe o ID do livro: ")
    guard let livro = biblioteca.buscarPorID(id) else {
        print("Livro não encontrado.")
        return nil
    }
    return livro
}

func editarLivro() {
    print("\n=== EDIÇÃO DE LIVRO ===")
    guard let livro = buscarLivroPorID() else { return }

    print("Dados atuais:")
    livro.exibirDetalhes()

    let titulo = Console.lerTexto("Novo título: ")
    let autor = Console.lerTexto("Novo autor: ")
    let ano = Console.lerInt("Novo ano de publicação: ", intervalo: 1...Calendar.current.component(.year, from: Date()))
    livro.editar(titulo: titulo, autor: autor, anoPublicacao: ano)

    if let digital = livro as? LivroDigital,
       Console.lerSimNao("Deseja alterar o tamanho do arquivo? (S/N): ") {
        digital.atualizarTamanho(Console.lerDoublePositivo("Novo tamanho em MB: "))
    }

    print("Livro atualizado com sucesso!")
}

while executando {
    exibirMenu()
    let opcao = Console.lerInt("Escolha uma opção: ", intervalo: 0...8)

    switch opcao {
    case 1:
        cadastrarLivro()
    case 2:
        biblioteca.listarTodos()
    case 3:
        print("\n=== BUSCA POR ID ===")
        buscarLivroPorID()?.exibirDetalhes()
    case 4:
        print("\n=== BUSCA POR TÍTULO ===")
        let trecho = Console.lerTexto("Digite parte do título: ")
        let resultados = biblioteca.buscarPorTitulo(trecho)
        if resultados.isEmpty {
            print("Nenhum livro encontrado.")
        } else {
            print("Foram encontrados \(resultados.count) livro(s):")
            resultados.forEach { $0.exibirDetalhes() }
        }
    case 5:
        editarLivro()
    case 6:
        print("\n=== EMPRÉSTIMO ===")
        if let livro = buscarLivroPorID() {
            print(livro.emprestar() ? "Empréstimo realizado com sucesso!" : "O livro já está emprestado.")
        }
    case 7:
        print("\n=== DEVOLUÇÃO ===")
        if let livro = buscarLivroPorID() {
            print(livro.devolver() ? "Devolução realizada com sucesso!" : "O livro já está disponível.")
        }
    case 8:
        print("\n=== REMOÇÃO ===")
        let id = Console.lerUUID("Informe o ID do livro: ")
        if let livro = biblioteca.buscarPorID(id) {
            livro.exibirDetalhes()
            if Console.lerSimNao("Confirma a remoção? (S/N): ") {
                print(biblioteca.remover(id: id) ? "Livro removido com sucesso!" : "Não foi possível remover o livro.")
            } else {
                print("Remoção cancelada.")
            }
        } else {
            print("Livro não encontrado.")
        }
    case 0:
        executando = false
        print("Obrigado por usar o sistema. Até mais!")
    default:
        break
    }
}
