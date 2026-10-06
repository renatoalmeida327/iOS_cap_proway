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
protocol CalculadoraSimples {
    func somar( n1: Int, n2: Int) -> Int
    func subtrair( n1: Int, n2: Int) -> Int
}

protocol CalculadoraCientifica {
    func seno( angulo: Double) -> Double
    
    func cosseno( angulo: Double) -> Double
}



class Calc: CalculadoraSimples, CalculadoraCientifica {
    func seno(angulo: Double) -> Double {
        let radianos = angulo * .pi / 180
        return sin(radianos)
    }
    
    func cosseno(angulo: Double) -> Double {
        let radianos = angulo * .pi / 180
        return cos(radianos)
    }
    
    func somar(n1: Int, n2: Int) -> Int {
        return n1 + n2
    }
    
    func subtrair(n1: Int, n2: Int) -> Int {
        return n1 - n2
    }
}
 let calc = Calc()
