//
//  ContentView.swift
//  TaskSwiftData
//
//  Created by usradmin on 17/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    //Consultar a la BDD
    @Query private var tareas: [Tareas]
    @State private var showAdd = false
    
    var body: some View {
        NavigationStack {
            List(tareas) { tarea in
                TareaRow(tarea: tarea)
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
}

//con (traits: .sampleData) ya estaría inyectando los datos de prueba que están en la BDD
#Preview(traits: .sampleData) {
    ContentView()
}


