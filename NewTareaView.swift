//
//  NewTareaView.swift
//  TaskSwiftData
//
//  Created by usradmin on 18/9/24.
//

import SwiftUI

struct NewTareaView: View {
    //Para quitar esta pantalla cuando ya no nos interese utilizarla
    @Environment(\.dismiss) private var dismiss
    
    //Recoger el valor de la BDD y necesito el context para insertar en la BDD
    @Environment(\.modelContext) private var context
    
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var fecha: Date = Date()
    @State private var estado: EstadoTarea = .pendiente
    
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    Text("Nombre de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese el nombre de la tarea", text: $nombre)
                }
                VStack(alignment: .leading) {
                    Text("Descripción de la tarea")
                        .font(.headline)
                        .padding(.leading, 5)
                    TextField("Ingrese la descripción de la tarea", text: $descripcion)
                }
                DatePicker(selection: $fecha, displayedComponents: .date) {
                    Text("Fecha de la tarea")
                }
                Picker(selection: $estado) {
                    //Como la enumeración EstadoTarea conforma el protocolo CaseIterable tenemos acceso a un array allCases para poder iterar por la enumeración
                    ForEach(EstadoTarea.allCases) { tarea in
                        Text(tarea.rawValue)
                    }
                } label: {
                    Text("Seleccione estado")
                }
            }
            .textFieldStyle(.roundedBorder)
            .navigationTitle("Nueva Tarea")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newTarea = Tareas(id: UUID(), nombre: nombre, descripcion: descripcion, fecha: fecha, estado: estado)
                        //insertar la nueva tarea en la BDD
                        context.insert(newTarea)
                        //una vez creada la nueva tarea cierro la pantalla
                        dismiss()
                    } label: {
                        Text("Crear")
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancelar")
                    }
                }
            }
        }
    }
}

// Para tener accedo al contexto de prueba
#Preview(traits: .sampleData) {
    NewTareaView()
}
