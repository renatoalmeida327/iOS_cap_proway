//
//  Tarefa.swift
//  ToDoList
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import Foundation

struct Tarefa: Identifiable {

    let id = UUID()

    var titulo: String

    var concluida: Bool = false
}