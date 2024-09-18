//
//  SampleData.swift
//  TaskSwiftData
//
//  Created by usradmin on 17/9/24.
//

import SwiftUI
import SwiftData

struct SampleData: PreviewModifier {
    
    
    // makeSharedContext() Forma parte del protocolo PreviewModifier
    // devuelve un ModelContainer de prueba
    static func makeSharedContext() async throws -> ModelContainer {
        let schema = Schema([
            Tareas.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: true) // se coloca a true para que no almencene en el BDD, sólo en memoria como es solo prueba
        
        let container =  try ModelContainer(for: schema, configurations: [modelConfiguration])
        
        let tarea1 = Tareas(id: UUID(), nombre: "Realizar masterclass", descripcion: "Tarea con respecto s la realización de la masterclass de SwiftData", fecha: .now, estado: .enProgreso)
        
        let tarea2 = Tareas(id: UUID(), nombre: "Subir video a Youtube", descripcion: "Una vez termine el directo subirlo a Youtube", fecha: .now, estado: .pendiente)
        
        //grabar en la BDD
        container.mainContext.insert(tarea1)
        container.mainContext.insert(tarea2)
        
        return container
        
    }
    
    //content es la parte de vista y el context es el tipo del ModelContainer que se recibe de makeSharedContext()
    func body(content: Content, context: ModelContainer) -> some View {
        content.modelContainer(context)
    }
}


// Esto es para usar los datos de prueba y presentarlos en preview del ContentView, esto es un código de Apple así que se copia y se pega
// @MainActor lo usa para no tener problemas de concurrencia con Swift 6 porque todos los datos van sobre el hilo principal
extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var sampleData: Self = .modifier(SampleData())
}
