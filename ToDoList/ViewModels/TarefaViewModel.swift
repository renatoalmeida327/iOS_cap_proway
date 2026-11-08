//
//  TarefaViewModel.swift
//  ToDoList
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import Foundation
import Observation

@Observable
final class TarefaViewModel {

    var tarefas: [Tarefa] = []

    var novaTarefa = ""

    var total: Int {
        tarefas.count
    }

    var concluidas: Int {
        tarefas.filter { $0.concluida }.count
    }

    var pendentes: Int {
        tarefas.filter { !$0.concluida }.count
    }

    func adicionarTarefa() {

        let titulo = novaTarefa.trimmingCharacters(
            in: .whitespacesAndNewlines
        )

        guard !titulo.isEmpty else {
            return
        }

        tarefas.append(
            Tarefa(
                titulo: titulo
            )
        )

        novaTarefa = ""
    }

    func alternarStatus(
        da tarefa: Tarefa
    ) {

        guard let indice = tarefas.firstIndex(
            where: { $0.id == tarefa.id }
        ) else {
            return
        }

        tarefas[indice].concluida.toggle()
    }

    func removerTarefa(
        at offsets: IndexSet
    ) {

        for index in offsets.sorted(by: >) {

            tarefas.remove(at: index)
        }
    }
}
