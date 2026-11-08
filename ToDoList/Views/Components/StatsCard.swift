//
//  StatsCard.swift
//  ToDoList
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import SwiftUI

struct StatsCard: View {

    let titulo: String
    let valor: Int
    let icone: String
    let cor: Color

    var body: some View {

        VStack(spacing: 12) {

            Image(systemName: icone)
                .font(.title2)
                .foregroundColor(cor)

            Text("\(valor)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)

            Text(titulo)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity)
        .padding()

        .background(.ultraThinMaterial)

        .clipShape(
            RoundedRectangle(
                cornerRadius: 20
            )
        )
    }
}