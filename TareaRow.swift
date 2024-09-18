struct TareaRow: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text(tarea.nombre)
                .font(.headline)
            
            HStack {
                //Formatea la fecha con formato largo sin hora
                Text(tarea.fecha.formatted(date: .long, time: .omitted))
                Spacer()
                Text(tarea.estado.rawValue)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }
}