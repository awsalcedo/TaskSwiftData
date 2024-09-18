//
//  DataModel.swift
//  TaskSwiftData
//
//  Created by usradmin on 17/9/24.
//

import Foundation
import SwiftData

enum EstadoTarea: String, Codable, CaseIterable, Identifiable {
    case pendiente = "Pendiente"
    case enProgreso = "En Progreso"
    case completada = "Completada"
    
    //Se puede hacer así o de la otra forma, esto sirve para el Picker
    //var id: String {rawValue}
    var id: Self { self }
}

//En SwiftData todo los campos de una tabla son todos de tipo get y set y deben ser var y no let

//Tareas no tiene que ser Codable porque es un elemento para base de datos
@Model
final class Tareas {
    @Attribute(.unique) var id: UUID //crea una clave principal y un indice de búsqueda por ese id
    var nombre: String
    var descripcion: String
    var fecha: Date
    var estado: EstadoTarea
    
    init(id: UUID, nombre: String, descripcion: String, fecha: Date, estado: EstadoTarea) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.fecha = fecha
        self.estado = estado
    }
}
