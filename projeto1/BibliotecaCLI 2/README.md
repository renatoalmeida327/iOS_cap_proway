# 📚 BibliotecaCLI

Sistema de gerenciamento de biblioteca executado no Terminal, desenvolvido em Swift para estudo de Programação Orientada a Objetos.

## Recursos

- CRUD completo de livros
- Busca por UUID e por trecho do título
- Controle de empréstimo e devolução
- Encapsulamento com `private(set)` e métodos modificadores
- Protocolo `Documento`
- Herança com `LivroDigital`
- Validação segura das entradas do console

## Como abrir no Xcode

1. Descompacte o projeto.
2. Abra o Xcode.
3. Selecione **File > Open**.
4. Selecione a pasta `BibliotecaCLI` ou o arquivo `Package.swift`.
5. Selecione o scheme `BibliotecaCLI`.
6. Execute com **Command + R**.
7. Use o console inferior do Xcode para digitar as opções.

Se o console não estiver visível, use **View > Debug Area > Activate Console**.

## Como executar pelo Terminal

```bash
cd BibliotecaCLI
swift run
```

## Estrutura

```text
BibliotecaCLI/
├── Package.swift
├── README.md
└── Sources/BibliotecaCLI/
    ├── Biblioteca.swift
    ├── Console.swift
    ├── Documento.swift
    ├── Livro.swift
    ├── LivroDigital.swift
    └── main.swift
```

## Conceitos aplicados

- **Abstração:** protocolo `Documento`.
- **Encapsulamento:** propriedades com alteração externa bloqueada.
- **Herança:** `LivroDigital` deriva de `Livro`.
- **Polimorfismo:** `LivroDigital` sobrescreve `exibirDetalhes()`.
- **Coleções:** livros mantidos em um array privado.
- **Fluxo de controle:** menu contínuo com `while` e `switch`.
- **Optionals:** entradas de `readLine()` e buscas são tratadas com segurança.

> Os dados ficam em memória e são apagados quando o programa termina.
