//
//  ViewModel.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

class ViewModel: ObservableObject{
    let gestorCoreData = CoreDataManager.instance
    
    @Published var elementoArray: [ElementoEntity] = []
    @Published var cristalArray: [CristalEntity] = []
    @Published var personaArray: [PersonaEntity] = []
    @Published var ensayoArray: [EnsayoEntity] = []
    
    init(){
        cargarDatos()
    }
    
    func cargarDatos(){
        
        elementoArray.removeAll()
        cristalArray.removeAll()
        personaArray.removeAll()
        ensayoArray.removeAll()
        
        let fetchElementos = NSFetchRequest<ElementoEntity>(entityName: "ElementoEntity")
        let fetchCristales = NSFetchRequest<CristalEntity>(entityName: "CristalEntity")
        let fetchPersonas = NSFetchRequest<PersonaEntity>(entityName: "PersonaEntity")
        let fetchEnsayos = NSFetchRequest<EnsayoEntity>(entityName: "EnsayoEntity")
        
        do{
            self.elementoArray = try gestorCoreData.contexto.fetch(fetchElementos).sorted(){$0.nombre! < $1.nombre!}
            self.cristalArray = try gestorCoreData.contexto.fetch(fetchCristales).sorted(){$0.nombre! < $1.nombre!}
            self.personaArray = try gestorCoreData.contexto.fetch(fetchPersonas).sorted(){$0.nombre! < $1.nombre!}
            self.ensayoArray = try gestorCoreData.contexto.fetch(fetchEnsayos).sorted(){$0.nombre! < $1.nombre!}
        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){
        gestorCoreData.save()
        cargarDatos()
    }
    
    func addPersona(nombre: String, foto: UIImage, email: String, contrasena: String, admin: Bool){
        let newPersona = PersonaEntity(context: gestorCoreData.contexto)
        newPersona.nombre = nombre
        newPersona.foto = foto.pngData()
        newPersona.email = email
        newPersona.contrasena = contrasena
        newPersona.admin = admin
        guardarDatos()
    }
    
    func deletePersona(indexSet: IndexSet){
        for index in indexSet{
            gestorCoreData.contexto.delete(personaArray[index])
        }
        guardarDatos()
    }
    
}
