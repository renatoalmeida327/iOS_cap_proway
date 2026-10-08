import Foundation


// ??  <- Operador de coalescência.
// !   <- Desembrulho forçado.



// Variáveis e Constantes
/*var nome = "Ralf"
var idade: Int = 36
var nome: String = "Ralf"
print(type(of: nome))*/

/*let pi = 3.14*/

// Informações nulas (nil)
/*var cargo: String?
print(cargo ?? "Cargo não informado.")*/

/*
    REGRAS PARA CRIAR VARIÁVEIS E CONSTANTES
    1. Não começar com números.
    2. Não possuir espaçamento.
    3. Não utilizar operadores matemáticos (+, -, *, /).
    4. Não utilizar pontos e vírgulas.
 */



// INTERAÇÃO COM O USUÁRIO E CONCATENAÇÃO
/*print("Olá! Qual é o seu nome?")
var nome = readLine()
print("Seja bem-vindo " + nome!)
print("Seja bem-vindo \(nome!)")*/



// CONVERTER DADOS
// Conversão de Tipo
/*var numero1 = 5
var numero2: Double = Double(numero1)
var numero3 = "6"
var numero4: Int = Int(numero3) ?? 0*/

// Cast
/*var desconhecida: Any = "Ralf"

if let tipoString = desconhecida as? String {
    print("A variável é do tipo String e seu valor é \(tipoString)")
} else if let tipoInt = desconhecida as? Int {
    print("A variável é do tipo Int e seu valor é \(tipoInt)")
} else if let tipoDouble = desconhecida as? Double {
    print("A variável é do tipo Double e seu valor é \(tipoDouble)")
}else if let tipoBool = desconhecida as? Bool {
    print("A variável é do tipo Bool e seu valor é \(tipoBool)")
} else {
    print("Tipo desconhecido.")
}*/



/*
    OPERADORES
    Lógicos: && (E)    || (OU)     ! (NEGAÇÃO)
    Aritméticos: +, -, *, /, %
    Relacionais: >, >=, <, <=, ==, !=
*/



// Condicionais - Simples, Encadeada, Aninhada e Operador ternário
// Simples
/*var idade = 19
if idade >= 18 {
    print("Maior de idade")
} else {
    print("Menor de idade")
}*/

// Encadeada
/*var media = 8.5
if media >= 7 {
    print("Aprovado(a)")
} else if media >= 5 {
    print("Em exame")
} else {
    print("Reprovado(a)")
}*/

// Aninhada
/*var media = 7.8
var faltas = 9

if faltas >= 10 {
    print("Aluno(a) reprovado(a) por faltas!")
} else {
    if media >= 7 {
        print("Aprovado(a)!")
    } else {
        print("Reprovado(a) por média!")
    }
}*/

// Operador ternário
/*var numero1 = 8, numero2 = 9
var resultado = numero1 == numero2 ? numero1+numero2 : numero1*numero2
print(resultado)*/



//Estrutura de escolha
let linguagem = "HTML"
switch linguagem {
    case "HTML":
    print("Linguagem de marcação")
    
    case "CSS":
    print("Linguagem de estilos")
    
    case "JavaScript":
    print("Lingragem de programação")
    
    case "Swift":
    print("Lingragem de progra")
    
    default:
    print("Linguagem não encontrada")
}

func helloWorld() {
    print("Hello World!")
}
helloWorld()
