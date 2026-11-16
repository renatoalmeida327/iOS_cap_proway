# Gerenciador de Eventos

Aplicativo iOS em SwiftUI com SwiftData, MVVM e alternância manual entre tema claro e escuro.

## Requisitos
- Xcode 15 ou superior
- iOS 17 ou superior

## Como executar
1. Descompacte o projeto.
2. Abra `GerenciadorEventos.xcodeproj` no Xcode.
3. Selecione um simulador com iOS 17 ou superior.
4. Execute com `Command + R`.

## Funcionalidades
- Criar, listar, editar e excluir eventos
- Persistência local com SwiftData
- Ordenação cronológica
- Busca por título ou local
- Validação de título e local
- Tema claro/escuro persistido com `@AppStorage`
- Exclusão com gesto de deslizar

## Arquitetura
- `Models/Evento.swift`: modelo `@Model`
- `ViewModels/EventoViewModel.swift`: estado `@Observable` e operações SwiftData
- `Views`: telas SwiftUI
- `Components`: componentes reutilizáveis
