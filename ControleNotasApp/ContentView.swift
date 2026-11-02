import SwiftUI

struct Aluno: Identifiable {
    let id = UUID()
    let nome: String
    let nota1: Double
    let nota2: Double

    var media: Double {
        (nota1 + nota2) / 2
    }

    var aprovado: Bool {
        media >= 7.0
    }
}

struct ContentView: View {

    @State private var nome = ""
    @State private var nota1 = ""
    @State private var nota2 = ""

    @State private var alunos: [Aluno] = []

    @State private var mensagemErro = ""

    var totalAlunos: Int {
        alunos.count
    }

    var aprovados: Int {
        alunos.filter { $0.aprovado }.count
    }

    var reprovados: Int {
        alunos.filter { !$0.aprovado }.count
    }

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    // Cabeçalho

                    VStack(spacing: 12) {

                        Image(systemName: "graduationcap.fill")
                            .font(.system(size: 50))
                            .foregroundColor(.orange)

                        Text("Minha Turma")
                            .font(.largeTitle)
                            .fontWeight(.bold)

                        Text("Cadastre alunos e acompanhe os resultados.")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)

                    // Cadastro

                    VStack(alignment: .leading, spacing: 16) {

                        Label("Cadastrar aluno",
                              systemImage: "person.badge.plus")
                            .font(.title2)
                            .fontWeight(.semibold)

                        TextField(
                            "Digite o nome completo",
                            text: $nome
                        )
                        .textFieldStyle(.roundedBorder)

                        HStack {

                            TextField(
                                "0 a 10",
                                text: $nota1
                            )
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)

                            TextField(
                                "0 a 10",
                                text: $nota2
                            )
                            .keyboardType(.decimalPad)
                            .textFieldStyle(.roundedBorder)
                        }

                        Button {

                            cadastrarAluno()

                        } label: {

                            Label(
                                "Cadastrar aluno",
                                systemImage: "plus.circle.fill"
                            )
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.orange)

                        if !mensagemErro.isEmpty {

                            Text(mensagemErro)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }

                    // Resumo

                    VStack(alignment: .leading, spacing: 16) {

                        Text("Resumo da turma")
                            .font(.title2)
                            .fontWeight(.bold)

                        HStack {

                            resumoCard(
                                titulo: "Alunos",
                                valor: totalAlunos,
                                icone: "person.3.fill",
                                cor: .blue
                            )

                            resumoCard(
                                titulo: "Aprovados",
                                valor: aprovados,
                                icone: "checkmark.circle.fill",
                                cor: .green
                            )

                            resumoCard(
                                titulo: "Reprovados",
                                valor: reprovados,
                                icone: "xmark.circle.fill",
                                cor: .red
                            )
                        }
                    }

                    // Lista

                    VStack(alignment: .leading, spacing: 12) {

                        HStack {

                            Text("Alunos cadastrados")
                                .font(.title2)
                                .fontWeight(.bold)

                            Spacer()

                            Text("\(alunos.count) registros")
                                .foregroundColor(.secondary)
                        }

                        if alunos.isEmpty {

                            ContentUnavailableView(
                                "Nenhum aluno cadastrado",
                                systemImage: "person.crop.rectangle"
                            )

                        } else {

                            ForEach(alunos) { aluno in

                                VStack(alignment: .leading, spacing: 8) {

                                    HStack {

                                        Text(aluno.nome)
                                            .font(.headline)

                                        Spacer()

                                        Button(
                                            role: .destructive
                                        ) {

                                            removerAluno(aluno)

                                        } label: {

                                            Image(systemName: "trash")
                                        }
                                    }

                                    Text("Nota 1: \(aluno.nota1, specifier: "%.1f")")

                                    Text("Nota 2: \(aluno.nota2, specifier: "%.1f")")

                                    Text("Média: \(aluno.media, specifier: "%.1f")")

                                    Text(
                                        aluno.aprovado
                                        ? "✅ Aprovado"
                                        : "❌ Reprovado"
                                    )
                                    .foregroundColor(
                                        aluno.aprovado
                                        ? .green
                                        : .red
                                    )
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(12)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Controle de Notas")
        }
    }

    // MARK: Funções

    func cadastrarAluno() {

        mensagemErro = ""

        guard !nome.trimmingCharacters(
            in: .whitespacesAndNewlines
        ).isEmpty else {

            mensagemErro = "Informe o nome do aluno."
            return
        }

        guard let n1 = Double(nota1),
              let n2 = Double(nota2) else {

            mensagemErro = "Digite notas válidas."
            return
        }

        guard (0...10).contains(n1),
              (0...10).contains(n2) else {

            mensagemErro = "As notas devem estar entre 0 e 10."
            return
        }

        let aluno = Aluno(
            nome: nome,
            nota1: n1,
            nota2: n2
        )

        alunos.append(aluno)

        nome = ""
        nota1 = ""
        nota2 = ""
    }

    func removerAluno(_ aluno: Aluno) {
        alunos.removeAll { $0.id == aluno.id }
    }

    @ViewBuilder
    func resumoCard(
        titulo: String,
        valor: Int,
        icone: String,
        cor: Color
    ) -> some View {

        VStack(spacing: 8) {

            Image(systemName: icone)
                .font(.title2)
                .foregroundColor(cor)

            Text("\(valor)")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text(titulo)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}
