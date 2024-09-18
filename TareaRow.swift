//
//  TareaRow.swift
//  TaskSwiftData
//
//  Created by usradmin on 18/9/24.
//

import SwiftUI

//el struct crea un member wise initializer que se genera de manera automática, cuando en un struct pongoo una constante sin valor (solo declarando) esto genera de manera automática el init(tarea: Tareas) {self.tarea = tarea} por lo que no es necesario poner el init()
struct TareaRow: View {
    let tarea: Tareas
    
    
    
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
