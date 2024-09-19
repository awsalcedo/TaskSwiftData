//
//  ContentView.swift
//  TaskSwiftData
//
//  Created by usradmin on 17/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    //Consultar a la BDD
    @Query private var tareas: [Tareas]
    @State private var showAdd = false
    
    var body: some View {
        NavigationStack {
            VStack {
                if tareas.isEmpty {
                    ContentUnavailableView("No hay tareas", systemImage: "list.bullet.clipboard", description: Text("Aún no existen tareas en la app. Por favor pulse el + a arriba a la derecha para crear una nueva tarea."))
                } else {
                    main
                }
            }
            .navigationTitle("Tareas")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        showAdd.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        // El signo de $ es el accedo en referencia al valor de showAdd
        /*.sheet(isPresented: $showAdd) {
            NewTareaView()
        }*/
        // si quiero que se vea a pantalla completa
        .fullScreenCover(isPresented: $showAdd) {
            NewTareaView()
        }
    }
    
    var main: some View {
        
        List {
            ForEach(tareas) { tarea in
                TareaRow(tarea: tarea)
            }
            .onDelete { index in
                // Puede ser de esta forma o de la otra forma
                /*if let v = index.first {
                    context.delete(tareas[v])
                }*/
                for i in index {
                    context.delete(tareas[i])
                }
            }
        }
    }
}

//con (traits: .sampleData) ya estaría inyectando los datos de prueba que están en la BDD
#Preview(traits: .sampleData) {
    ContentView()
}


