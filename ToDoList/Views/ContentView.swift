//
//  ContentView.swift
//  ToDoList
//
//  Created by Almeida, Renato Pereira de on 08/11/26.
//


import SwiftUI

struct ContentView: View {

    @State private var viewModel =
        TarefaViewModel()

    var body: some View {

        NavigationStack {

            ZStack {

                LinearGradient(
                    colors: [
                        Color.black,
                        Color.indigo,
                        Color.blue.opacity(0.6)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {

                    VStack(spacing: 24) {

                        // Header

                        VStack(spacing: 10) {

                            Image(
                                systemName: "checklist"
                            )
                            .font(.system(size: 55))
                            .foregroundColor(.white)

                            Text("My Tasks")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.white)

                            Text(
                                "Organize seu dia com estilo"
                            )
                            .foregroundColor(.gray)
                        }

                        // Nova tarefa

                        GlassCard {

                            HStack {

                                TextField(
                                    "Adicionar tarefa",
                                    text: $viewModel.novaTarefa
                                )
                                .foregroundColor(.white)

                                Button {

                                    viewModel.adicionarTarefa()

                                } label: {

                                    Image(
                                        systemName:
                                            "plus.circle.fill"
                                    )
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                }
                            }
                        }

                        // Resumo

                        HStack {

                            StatsCard(
                                titulo: "Total",
                                valor: viewModel.total,
                                icone: "list.bullet",
                                cor: .blue
                            )

                            StatsCard(
                                titulo: "Feitas",
                                valor: viewModel.concluidas,
                                icone: "checkmark.circle.fill",
                                cor: .green
                            )

                            StatsCard(
                                titulo: "Pendentes",
                                valor: viewModel.pendentes,
                                icone: "clock.fill",
                                cor: .orange
                            )
                        }

                        // Lista

                        LazyVStack(
                            spacing: 12
                        ) {

                            ForEach(
                                viewModel.tarefas
                            ) { tarefa in

                                TarefaRow(
                                    tarefa: tarefa
                                ) {

                                    viewModel
                                        .alternarStatus(
                                            da: tarefa
                                        )
                                }
                                .swipeActions {

                                    Button(
                                        role: .destructive
                                    ) {

                                        if let index =
                                            viewModel
                                            .tarefas
                                            .firstIndex(
                                                where: {
                                                    $0.id ==
                                                    tarefa.id
                                                }
                                            ) {

                                            viewModel
                                                .removerTarefa(
                                                    at:
                                                    IndexSet(
                                                        integer: index
                                                    )
                                                )
                                        }

                                    } label: {

                                        Label(
                                            "Excluir",
                                            systemImage:
                                                "trash"
                                        )
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationBarHidden(true)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
