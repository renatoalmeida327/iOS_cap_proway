//
//  TarefaRow.swift
//  MyTool
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import SwiftUI

struct TarefaRow: View {

    let tarefa: Tarefa

    let onToggle: () -> Void

    var body: some View {

        GlassCard {

            HStack(spacing: 15) {

                Button {

                    onToggle()

                } label: {

                    Image(
                        systemName:
                            tarefa.concluida
                        ? "checkmark.circle.fill"
                        : "circle"
                    )
                    .font(.title2)
                    .foregroundColor(
                        tarefa.concluida
                        ? .green
                        : .white
                    )
                }

                VStack(
                    alignment: .leading,
                    spacing: 4
                ) {

                    Text(tarefa.titulo)
                        .foregroundColor(.white)
                        .strikethrough(
                            tarefa.concluida
                        )

                    Text(
                        tarefa.concluida
                        ? "Concluída"
                        : "Pendente"
                    )
                    .font(.caption)

                    .foregroundColor(
                        tarefa.concluida
                        ? .green
                        : .orange
                    )
                }

                Spacer()
            }
        }
    }
}