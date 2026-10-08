//// Para ter acesso a funções matemáticas
//import Foundation
//
//// 1o Exemplo - Classe, atributo, método e objeto.
//class Pessoa {
//    var nome: String = ""
//    
//    func apresentacao()-> Void {
//        print("Olá! Meu nome é \(nome).")
//    }
//}
//
//let p1 = Pessoa()
//p1.nome = "Alice"
//p1.apresentacao()

// Para ter acesso a funções matemáticas
import Foundation

// 2o Exemplo - Construtor e destrutor.
class Pessoa {
    var nome: String = ""
    
    // Construtor
    init() {
        print("Construtor executado!")
    }
    
    init(nome: String) {
        self.nome = nome
        apresentacao()
    }
    
    // Destrutor
    deinit {
        print("Destrutor executado!")
    }
    
    func apresentacao()-> Void {
        print("Olá! Meu nome é \(nome).")
    }
}

do {
    let p1 = Pessoa()
    p1.nome = "Alice"
    p1.apresentacao()
}

let p2 = Pessoa(nome: "Henrique")


// 3o Exemplo - Modificadores de acesso e propriedade computada.
class Produto {
    // Boas práticas: Atributos privados devem iniciar com underline
    private var _marca: String = ""
    
    // Propriedade computada (GET e SET)
    var marca: String {
        get {return _marca}
        set(marca) { _marca = marca}
    }
}

let p = Produto()
p.marca = "Apple"
print(p.marca)

/*
    Internal (padrão/default): Visível dentro do módulo.
 
    Private: Visível dentro da classe
 
    Public: Visível dentro do módulo e de módulos externos.
        restrições:
            - não pode herdar classes de outros módulos
            - não é possível sobrescrita
 
    Open: Visível dentro do módulo e de módulos externos.
        restrições:
            - pode herdar classes de outros módulos.
            - pode realizar sobrescrita.
 */

// 4o Exemplo - Herança
//class PessoaHeranca {
//    private var _nome: String = ""
//    
//    var nome: String {
//        get {return _nome}
//        set(nome) { _nome = nome}
//    }
//}
//
//class Colaborador: PessoaHeranca {
//    var cargo: String = ""
//    var salario: Double = 0.0
//    
//    func exibirDados() -> Void {
//        print("Nome: \(nome)")
//        print("Cargo: \(cargo)")
//        print("Salário: \(salario)")
//    }
//}
//
//let obj = Colaborador()
//obj.nome = "Viviane"
//obj.cargo = "Desenvolvedora iOS"
//obj.salario = 15500.50
//obj.exibirDados()



// 5o Exemplo - Herança (super)
class PessoaHeranca {
    private var _nome: String = ""
    
    var nome: String {
        get {return _nome}
        set(nome) { _nome = nome}
    }
    
    init(_nome: String) {
        self._nome = _nome
    }
}

class Colaborador: PessoaHeranca {
    private var _cargo: String = ""
    private var _salario: Double = 0.0
    
    init(nome: String, cargo: String, salario: Double) {
        _cargo = cargo
        _salario = salario
        
        super.init(_nome: nome)
    }
    
    func exibirDados() -> Void {
        print("Nome: \(nome)")
        print("Cargo: \(_cargo)")
        print("Salário: \(_salario)")
    }
}

let obj = Colaborador(nome: "Viviane", cargo: "Desenvolvedora iOS", salario: 15580.00 )
obj.exibirDados()


// 6o Exemplo - Atributos e funções/métodos estáticos
class Calculadora {
    //Atributo
    static var numero: Int = 8
    
    static func somar( numero1: Int, numero2: Int) -> Void {
        print("A soma de \(numero1) + \(numero2) é \(numero1 + numero2)")
    }
}

print(Calculadora.numero)
Calculadora.somar(numero1: 5, numero2: 4)


// 7o Exemplo - Protocol (Abstração e Interface)
//protocol CalculadoraSimples {
//    func somar( n1: Int, n2: Int) -> Int
//    func subtrair( n1: Int, n2: Int) -> Int
//}
//
//protocol CalculadoraCientifica {
//    func seno( angulo: Double) -> Double
//    
//    func cosseno( angulo: Double) -> Double
//}
//
//
//
//class Calc: CalculadoraSimples, CalculadoraCientifica {
//    func seno(angulo: Double) -> Double {
//        let radianos = angulo * .pi / 180
//        return sin(radianos)
//    }
//    
//    func cosseno(angulo: Double) -> Double {
//        let radianos = angulo * .pi / 180
//        return cos(radianos)
//    }
//    
//    func somar(n1: Int, n2: Int) -> Int {
//        return n1 + n2
//    }
//    
//    func subtrair(n1: Int, n2: Int) -> Int {
//        return n1 - n2
//    }
//}
// let calc = Calc()


// 8o Exemplo - Polimorfismo

// Sobrecarga (overloading)
class Calculos {
    func somar( n1: Int, n2: Int) {
        print("A soma dos dois valores é \(n1 + n2)")
    }
    
    func somar( n1: Int, n2: Int, n3: Int) {
        print("A soma dos dois valores é \(n1 + n2 + n3)")
    }
}

let calculos = Calculos()
calculos.somar(n1: 5, n2: 5)
calculos.somar(n1: 5, n2: 5, n3: 5)

// Sobrescrita (override)
class DescontoPadrao {
    
    var salario: Double = 0.0
    
    func desconto() -> Void {
        print("O Desconto Padrão será de \(salario * 0.1)")
    }
    
}

class DescontoTI: DescontoPadrao {
    override func desconto() -> Void {
        print("O Desconto para TI será de \(salario * 0.2)")
    }
}

let objPadrao = DescontoPadrao()
objPadrao.salario = 12000
objPadrao.desconto()

let objTI = DescontoTI()
objTI.salario = 12000
objTI.desconto()



// 10o Exemplo - Extension
class Calculator {
    func somar(n1: Int, n2: Int) -> Int {
        return n1 + n2
    }
    func subtrair(n1: Int, n2: Int) -> Int {
        return n1 - n2
    }
}

extension Calculator {
    func multiplicar(n1: Int, n2: Int) -> Int {
        return n1 * n2
    }
}

let calc = Calculator()
print(calc.somar(n1: 7, n2: 7))
print(calc.multiplicar(n1: 7, n2: 7))



// 11o Exemplo - Generics

// 1a Etapa -> Criar o protocol
protocol Cadastravel {
    var id: Int { get }
    func exibirDados() -> String
}

// 2a Etapa -> Criar as classes
class PessoaCadastravel: Cadastravel {
    // Atributos
    var id: Int
    var nome: String = ""
    
    init(id: Int, nome: String) {
        self.id = id
        self.nome = nome
    }
    
    // Função
    func exibirDados() -> String {
        return "Identificador: \(id) | Nome: \(nome)"
    }
}

class ProdutoCadastravel: Cadastravel {
    // Atributos
    var id: Int
    var nome: String = ""
    
    init(id: Int, nome: String) {
        self.id = id
        self.nome = nome
    }
    
    // Função
    func exibirDados() -> String {
        return "Identificador: \(id) | Nome: \(nome)"
    }
}

// 3a Etapa -> Criar classe genérica para gerenciar os dados
class GerenciarDados<T:Cadastravel> {
    
    // Vetor genérico
    private var vetor: [T] = []
    
    // Função para efetuar o cadastro
    func cadastras(obj: T) {
        vetor.append(obj)
    }
    
    // Função para listar os re=gistros
    func listar() {
        for item in vetor {
            print(item.exibirDados())
        }
        print("-------------")
    }
}

// 4a Etapa -> Vetores de cada tipo de dado e criar os objetos.
var vetorPessoas = GerenciarDados<PessoaCadastravel>()
var vetorProduto = GerenciarDados<ProdutoCadastravel>()

let pessoa1 = PessoaCadastravel(id: 1, nome: "Aline")
let pessoa2 = PessoaCadastravel(id: 2, nome: "Douglas")
let pessoa3 = PessoaCadastravel(id: 3, nome: "Fernanda")

let produto1 = ProdutoCadastravel(id: 1, nome: "MackBook Pro M5 16GB")
let produto2 = ProdutoCadastravel(id: 2, nome: "iPhone 18")
let produto3 = ProdutoCadastravel(id: 3, nome: "Monitor LG 54 polegadas")

vetorPessoas.cadastras(obj: pessoa1)
vetorPessoas.cadastras(obj: pessoa2)
vetorPessoas.cadastras(obj: pessoa3)

vetorProduto.cadastras(obj: produto1)
vetorProduto.cadastras(obj: produto2)
vetorProduto.cadastras(obj: produto3)

vetorPessoas.listar()
vetorProduto.listar()


// 12o Exemplo - Struct
struct People {
    var nome: String
    var idade: Int
}

let p1 = People(nome: "Priscila", idade: 31)

// Características das Structs em Swift

// 1. Tipo de Valor (Value Type)
// - Elas são copiadas quando atribuídas a uma nova variável ou passadas para uma função.
// - Modificar uma cópia não altera a instância original, garantindo mais segurança contra efeitos colaterais.

// 2. Inicializador Padrão Automático (Memberwise Initializer)
// - O Swift gera automaticamente um inicializador que aceita parâmetros para todas as propriedades.
// - Não há necessidade de escrever o código do `init` manualmente, a menos que você queira uma lógica customizada.

// 3. Imutabilidade com 'let'
// - Se uma instância de struct for declarada com `let`, todas as suas propriedades se tornam imutáveis.
// - Isso acontece mesmo que as propriedades internas tenham sido declaradas com `var`.

// 4. Mutabilidade Explícita (Mutating Methods)
// - Funções internas que alteram as propriedades da struct precisam da palavra-chave `mutating`.
// - Isso avisa ao compilador que o método vai modificar o valor da própria estrutura.

// 5. Sem Herança
// - Structs não podem herdar de outras structs (não existe herança de classe para classe).
// - No entanto, elas podem adotar e herdar comportamentos através de Protocolos (Protocols).
