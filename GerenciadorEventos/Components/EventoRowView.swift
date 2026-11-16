import SwiftUI

struct EventoRowView: View {
    let evento: Evento

    var body: some View {
        HStack(spacing: 14) {
            VStack(spacing: 2) {
                Text(evento.dataHora, format: .dateTime.day())
                    .font(.title2.bold())
                Text(evento.dataHora, format: .dateTime.month(.abbreviated))
                    .font(.caption.weight(.semibold))
                    .textCase(.uppercase)
            }
            .foregroundStyle(.white)
            .frame(width: 58, height: 58)
            .background(.blue.gradient, in: RoundedRectangle(cornerRadius: 14))

            VStack(alignment: .leading, spacing: 5) {
                Text(evento.titulo)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Label(evento.local, systemImage: "mappin.and.ellipse")
                Label {
                    Text(evento.dataHora, format: .dateTime.hour().minute())
                } icon: {
                    Image(systemName: "clock")
                }
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)

            Spacer()
            Image(systemName: "chevron.right")
                .font(.caption.bold())
                .foregroundStyle(.tertiary)
        }
        .padding(.vertical, 4)
    }
}
