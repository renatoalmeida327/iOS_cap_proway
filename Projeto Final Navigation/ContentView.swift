import SwiftUI

// Modelo

struct PacoteViagem: Identifiable {
    let id = UUID()
    let titulo: String
    let diarias: Int
    let local: String
    let dataPartida: String
    let dataChegada: String
    let informacoesHotel: String
    let simboloNome: String
    let cor: Color
    let preco: Double
}

// Dados de exemplo

let pacotesDisponiveis: [PacoteViagem] = [
    PacoteViagem(
        titulo: "Rio de Janeiro Inesquecível",
        diarias: 5,
        local: "Rio de Janeiro, Brasil",
        dataPartida: "15/01/2027",
        dataChegada: "20/01/2027",
        informacoesHotel: "Hospedagem em Copacabana, com café da manhã incluso.",
        simboloNome: "sun.max.fill",
        cor: .orange,
        preco: 3299.90
    ),
    PacoteViagem(
        titulo: "Paris dos Sonhos",
        diarias: 7,
        local: "Paris, França",
        dataPartida: "10/03/2027",
        dataChegada: "17/03/2027",
        informacoesHotel: "Hospedagem em hotel 4 estrelas próximo à Torre Eiffel.",
        simboloNome: "building.columns.fill",
        cor: .indigo,
        preco: 8999.90
    ),
    PacoteViagem(
        titulo: "Aventura em Gramado",
        diarias: 4,
        local: "Gramado, Brasil",
        dataPartida: "05/07/2027",
        dataChegada: "09/07/2027",
        informacoesHotel: "Hospedagem em pousada no centro, com café da manhã.",
        simboloNome: "leaf.fill",
        cor: .green,
        preco: 2499.90
    ),
    PacoteViagem(
        titulo: "Descobrindo Nova York",
        diarias: 6,
        local: "Nova York, Estados Unidos",
        dataPartida: "12/09/2027",
        dataChegada: "18/09/2027",
        informacoesHotel: "Hospedagem em hotel 4 estrelas próximo à Times Square.",
        simboloNome: "building.2.fill",
        cor: .blue,
        preco: 10499.90
    )
]

// Aplicativo principal

@main
struct AgenciaViagensApp: App {
    var body: some Scene {
        WindowGroup {
            TelaInicial()
        }
    }
}

// Tela inicial

struct TelaInicial: View {
    @State private var favoritos: Set<UUID> = []

    var body: some View {
        NavigationStack {
            List {
                ForEach(pacotesDisponiveis) { pacote in
                    HStack(spacing: 12) {
                        NavigationLink {
                            TelaDetalhes(pacote: pacote, favoritos: $favoritos)
                        } label: {
                            HStack(spacing: 12) {
                                CartaoSimbolo(pacote: pacote, largura: 100, altura: 85)

                                VStack(alignment: .leading, spacing: 5) {
                                    Text(pacote.titulo)
                                        .font(.headline)
                                        .foregroundStyle(.primary)

                                    Label(pacote.local, systemImage: "mappin.and.ellipse")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)

                                    Text("\(pacote.diarias) diárias")
                                        .font(.caption)
                                        .foregroundStyle(.secondary)

                                    Text(formatarPreco(pacote.preco))
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundStyle(.blue)
                                }
                            }
                        }

                        Button {
                            alternarFavorito(pacote)
                        } label: {
                            Image(systemName: favoritos.contains(pacote.id) ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundStyle(.red)
                        }
                        .buttonStyle(.borderless)
                        .accessibilityLabel(
                            favoritos.contains(pacote.id)
                                ? "Remover dos favoritos"
                                : "Adicionar aos favoritos"
                        )
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Explorar Viagens")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        TelaFavoritos(pacotes: pacotesDisponiveis, favoritos: $favoritos)
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "heart.fill")
                            Text("\(favoritos.count)")
                                .fontWeight(.bold)
                        }
                        .foregroundStyle(.red)
                    }
                    .accessibilityLabel("Favoritos: \(favoritos.count)")
                }
            }
        }
    }

    private func alternarFavorito(_ pacote: PacoteViagem) {
        if favoritos.contains(pacote.id) {
            favoritos.remove(pacote.id)
        } else {
            favoritos.insert(pacote.id)
        }
    }
}

// Tela de detalhes

struct TelaDetalhes: View {
    let pacote: PacoteViagem
    @Binding var favoritos: Set<UUID>
    @State private var mostrarMensagemReserva = false

    private var pacoteFavoritado: Bool {
        favoritos.contains(pacote.id)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                CartaoSimbolo(pacote: pacote, largura: nil, altura: 250)

                VStack(alignment: .leading, spacing: 8) {
                    Text(pacote.titulo)
                        .font(.title)
                        .fontWeight(.bold)

                    Label(pacote.local, systemImage: "mappin.and.ellipse")
                        .foregroundStyle(.secondary)
                }

                Divider()

                VStack(alignment: .leading, spacing: 12) {
                    Text("Informações da viagem")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Label("Partida: \(pacote.dataPartida)", systemImage: "airplane.departure")
                    Label("Duração: \(pacote.diarias) diárias", systemImage: "calendar")
                    Label("Retorno: \(pacote.dataChegada)", systemImage: "airplane.arrival")
                }

                Divider()

                VStack(alignment: .leading, spacing: 8) {
                    Text("Hospedagem")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Label {
                        Text(pacote.informacoesHotel)
                    } icon: {
                        Image(systemName: "bed.double.fill")
                    }
                }

                Button {
                    alternarFavorito()
                } label: {
                    Label(
                        pacoteFavoritado ? "Remover dos favoritos" : "Adicionar aos favoritos",
                        systemImage: pacoteFavoritado ? "heart.fill" : "heart"
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(.red)
                .controlSize(.large)

                Button {
                    mostrarMensagemReserva = true
                } label: {
                    VStack(spacing: 3) {
                        Text("Reservar agora")
                            .fontWeight(.bold)
                        Text(formatarPreco(pacote.preco))
                            .font(.subheadline)
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            }
            .padding()
        }
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Reserva ilustrativa", isPresented: $mostrarMensagemReserva) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Você selecionou o pacote \(pacote.titulo) por \(formatarPreco(pacote.preco)).")
        }
    }

    private func alternarFavorito() {
        if pacoteFavoritado {
            favoritos.remove(pacote.id)
        } else {
            favoritos.insert(pacote.id)
        }
    }
}

// Tela de favoritos

struct TelaFavoritos: View {
    let pacotes: [PacoteViagem]
    @Binding var favoritos: Set<UUID>

    private var pacotesFavoritados: [PacoteViagem] {
        pacotes.filter { favoritos.contains($0.id) }
    }

    var body: some View {
        Group {
            if pacotesFavoritados.isEmpty {
                VStack(spacing: 12) {
                    Image(systemName: "heart.slash")
                        .font(.system(size: 55))
                        .foregroundStyle(.secondary)

                    Text("Nenhum favorito")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("Os pacotes marcados como favoritos aparecerão aqui.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
            } else {
                List {
                    ForEach(pacotesFavoritados) { pacote in
                        HStack(spacing: 12) {
                            NavigationLink {
                                TelaDetalhes(pacote: pacote, favoritos: $favoritos)
                            } label: {
                                HStack(spacing: 12) {
                                    CartaoSimbolo(pacote: pacote, largura: 90, altura: 75)

                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(pacote.titulo)
                                            .font(.headline)
                                        Text(pacote.local)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                        Text(formatarPreco(pacote.preco))
                                            .fontWeight(.bold)
                                            .foregroundStyle(.blue)
                                    }
                                }
                            }

                            Button {
                                favoritos.remove(pacote.id)
                            } label: {
                                Image(systemName: "heart.fill")
                                    .font(.title2)
                                    .foregroundStyle(.red)
                            }
                            .buttonStyle(.borderless)
                            .accessibilityLabel("Remover \(pacote.titulo) dos favoritos")
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle("Meus Favoritos")
    }
}

// Componente visual com SF Symbols

struct CartaoSimbolo: View {
    let pacote: PacoteViagem
    let largura: CGFloat?
    let altura: CGFloat

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(pacote.cor.gradient)

            Image(systemName: pacote.simboloNome)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white)
                .padding(altura * 0.23)
        }
        .frame(width: largura, height: altura)
        .frame(maxWidth: largura == nil ? .infinity : nil)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Símbolo de \(pacote.local)")
    }
}

// Formatação do preço

func formatarPreco(_ preco: Double) -> String {
    preco.formatted(
        .currency(code: "BRL")
        .locale(Locale(identifier: "pt_BR"))
    )
}

#Preview("Aplicativo de Viagens") {
    TelaInicial()
}
