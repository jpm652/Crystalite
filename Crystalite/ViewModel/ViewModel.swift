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
    @Published var ayudaArray: [AyudaEntity] = []
    @Published var modoOscuro: Bool = false
    @Published var personaLogin : PersonaEntity = PersonaEntity()
    
    init(){
        


        cargarDatos()
        
        cargarAyuda()
        crearAdministrador()
        cargarElementos()
        
        UITabBar.appearance().backgroundColor = .systemBackground
        UITableView.appearance().backgroundColor = .myCustomColor
    }
    
    func cargarDatos(){
        
        elementoArray.removeAll()
        cristalArray.removeAll()
        personaArray.removeAll()
        ensayoArray.removeAll()
        ayudaArray.removeAll()
        
        let fetchElementos = NSFetchRequest<ElementoEntity>(entityName: "ElementoEntity")
        let fetchCristales = NSFetchRequest<CristalEntity>(entityName: "CristalEntity")
        let fetchPersonas = NSFetchRequest<PersonaEntity>(entityName: "PersonaEntity")
        let fetchEnsayos = NSFetchRequest<EnsayoEntity>(entityName: "EnsayoEntity")
        let fetchAyuda = NSFetchRequest<AyudaEntity>(entityName: "AyudaEntity")
        
        do{
            self.elementoArray = try gestorCoreData.contexto.fetch(fetchElementos).sorted(){$0.nombre! < $1.nombre!}
            self.cristalArray = try gestorCoreData.contexto.fetch(fetchCristales).sorted(){$0.nombre! < $1.nombre!}
            self.personaArray = try gestorCoreData.contexto.fetch(fetchPersonas).sorted(){$0.nombre! < $1.nombre!}
            self.ensayoArray = try gestorCoreData.contexto.fetch(fetchEnsayos).sorted(){$0.nombre! < $1.nombre!}
            self.ayudaArray = try gestorCoreData.contexto.fetch(fetchAyuda) // .sorted(){$0.pregunta! < $1.pregunta!}
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
    
    func editCorreoPersona(persona : PersonaEntity, correoNuevo : String){
        
        persona.email = correoNuevo
        
        guardarDatos()
    }
    
    func editContrasenaPersona(persona : PersonaEntity, contrasenaNueva : String){
        
        persona.contrasena = contrasenaNueva
        
        guardarDatos()
    }
    
    func addEnsayo(persona: PersonaEntity, nombre: String, fecha: Date, enProceso: Bool, resultado: String, al:Double, ba:Double, ca:Double,ir:Double, k:Double, mg:Double, creador: String ){
        let newEnsayo = EnsayoEntity(context: gestorCoreData.contexto)
        newEnsayo.personaRelation = persona
        newEnsayo.nombre = nombre
        newEnsayo.fecha = fecha
        newEnsayo.enProceso = enProceso
        newEnsayo.resultCristal = resultado
        newEnsayo.al = al
        newEnsayo.ba = ba
        newEnsayo.ca = ca
        newEnsayo.mg = mg
        newEnsayo.k = k
        newEnsayo.ir = ir
        newEnsayo.creador = creador
        
        guardarDatos()
    }
    func editNombreEnsayo(ensayo : EnsayoEntity, nombrenuevo : String){
        
        ensayo.nombre = nombrenuevo
        
        guardarDatos()
    }
    
    func editEnsayoEnProceso(ensayo:EnsayoEntity, nombrenuevo: String, enProceso: Bool, resultado: String, al:Double, ba:Double, ca:Double,ir:Double, k:Double, mg:Double , creador : String){
        
        ensayo.nombre = nombrenuevo
        ensayo.enProceso = enProceso
        ensayo.resultCristal = resultado
        ensayo.al = al
        ensayo.ba = ba
        ensayo.ca = ca
        ensayo.ir = ir
        ensayo.k = k
        ensayo.mg = mg
        ensayo.creador = creador
        guardarDatos()
    }
    
    func deleteEnsayo(ensayo: EnsayoEntity){
        gestorCoreData.contexto.delete(ensayo)
        guardarDatos()
    }
    
    func addElemento(iniciales: String, valor : Double, nombre : String, descripcion: String){
        
        let newElemento = ElementoEntity(context: gestorCoreData.contexto)
        newElemento.iniciales = iniciales
        newElemento.valor = valor
        newElemento.nombre = nombre
        newElemento.descripcion = descripcion
        
        guardarDatos()
    }
    func editElemento(elemento : ElementoEntity, valorNuevo : Double){
        
        elemento.valor = valorNuevo
        
        guardarDatos()
    }
    
    func deleteElemento(elemento: ElementoEntity){
        gestorCoreData.contexto.delete(elemento)
        guardarDatos()
    }
    
    func addCristal(nombre : String, descripcion : String){
        
        let newCristal = CristalEntity(context: gestorCoreData.contexto)
        newCristal.nombre = nombre
        newCristal.descripcion = descripcion
        
        guardarDatos()
    }
    
    func deleteCristal(cristal: ElementoEntity){
        gestorCoreData.contexto.delete(cristal)
        guardarDatos()
    }
    
    func addAyuda(pregunta : String, respuesta : String){
        
        let newAyuda = AyudaEntity(context: gestorCoreData.contexto)
        newAyuda.pregunta = pregunta
        newAyuda.respuesta = respuesta
        
        guardarDatos()
    }
    
    func deleteAyuda(ayuda: AyudaEntity){
        gestorCoreData.contexto.delete(ayuda)
        guardarDatos()
    }
    
    
    func cargarElementos(){
        
        if(!elementoArray.isEmpty){
            for i in 0...(elementoArray.count - 1){
                gestorCoreData.contexto.delete(elementoArray[i])
            }
        }
        addElemento(iniciales: "Al",valor: 0.0, nombre: "Aluminio",descripcion: "El aluminio es un elemento qu??mico, de s??mbolo Al y n??mero at??mico 13. Se trata de un metal no ferromagn??tico. Es el tercer elemento m??s com??n encontrado en la corteza terrestre. \nLos compuestos de aluminio forman el 8 % de la corteza de la tierra y se encuentran presentes en la mayor??a de las rocas, de la vegetaci??n y de los animales.")
        addElemento(iniciales: "RI",valor: 0.0, nombre: "Indice de refraccion",descripcion: "Se denomina ??ndice de refracci??n al cociente de la velocidad de la luz en el vac??o y la velocidad de la luz en el medio cuyo ??ndice se calcula.\n Se simboliza con la letra n y se trata de un valor adimensional. El ??ndice de refracci??n de un medio es una medida para saber cu??nto se reduce la velocidad de la luz (o de otras ondas tales como ondas ac??sticas) dentro del medio.")
        addElemento(iniciales: "Ba",valor: 0.0, nombre: "Bario",descripcion: "El bario es un elemento qu??mico de la tabla peri??dica cuyo s??mbolo es Ba y su n??mero at??mico es 56. Metal alcalinot??rreo, el bario es el 18.?? elemento m??s com??n, ocupando una parte de 2000 de la corteza terrestre.")
        addElemento(iniciales: "Ca",valor: 0.0, nombre: "Calcio",descripcion: "El calcio es un elemento qu??mico, de s??mbolo Ca y de n??mero at??mico 20. Su masa at??mica es 40,078 u. El calcio es un metal blando, gris??ceo, y es el quinto m??s abundante en masa de la corteza terrestre. Tambi??n es el ion m??s abundante disuelto en el agua de mar, tanto como por su molaridad y como por su masa, despu??s del sodio, cloruros, magnesio y sulfatos.")
        addElemento(iniciales: "K",valor: 0.0, nombre: "Potasio",descripcion: "El potasio es un elemento qu??mico de la tabla peri??dica cuyo s??mbolo qu??mico es K, cuyo n??mero at??mico es 19.\n Es un metal alcalino de color blanco-plateado, que abunda en la naturaleza en los elementos relacionados con el agua salada y otros minerales. Se oxida r??pidamente en el aire, es muy reactivo, especialmente en agua, y se parece qu??micamente al sodio.")
        addElemento(iniciales: "Mg",valor: 0.0, nombre: "Magnesio",descripcion: "El magnesio es el elemento qu??mico de s??mbolo Mg y n??mero at??mico 12. Su masa at??mica es de 24,305 u.\n Es el octavo elemento en abundancia en el orden del  % de la corteza terrestre y el tercero m??s abundante disuelto en el agua de mar.")
    }
    
    func crearAdministrador(){
        if(!personaArray.isEmpty){
            for i in 0...(personaArray.count - 1){
                if(personaArray[i].admin == true){
                    gestorCoreData.contexto.delete(personaArray[i])
                }
            }
        }
        addPersona(nombre: "Administrador", foto: UIImage(systemName: "person.badge.key") ?? UIImage(), email: "Admin", contrasena: "admin", admin: true)
    }
    
    func cargarAyuda(){
        
        if(!ayudaArray.isEmpty){
            for i in 0...(ayudaArray.count - 1){
                gestorCoreData.contexto.delete(ayudaArray[i])
            }
        }
        
        addAyuda(pregunta: "??Qu?? es Crystalite?", respuesta: "Crystalite es una app que va a obtener el tipo de cristal a raiz del porcentaje de los elementos quimicos, obtenidos mediante el analisis del cristal.")
        
        addAyuda(pregunta: "??C??mo a??adir un ensayo?", respuesta: "Para realizar un ensayo y obtener el tipo de cristal se debe de ir a la pesta??a 'Clasificaci??n' e introducir el porcentajee obtenido de cada elemento, y por ??ltimo, seleccionar al bot??n 'Clasificar Cristal'.")
        
        addAyuda(pregunta: "??D??nde se puede ver los ensayos realizados?", respuesta: "Los ensayos relizados se pueden ver y/o completar en la pesta??a 'Historial'. ")
        
        addAyuda(pregunta: "??Se puede dejar un ensayo incompleto?", respuesta: "S??, si no se tienen todos los datos necesarios se puede dejar el ensayo 'En Proceso' y posteriormente finalizarlo. Para encontrar los ensayos que estan en proceso, existe una opcion en la vista Historial llamada 'En Proceso' donde se podran ver. ")
        
        addAyuda(pregunta: "??Se puede cambiar el nombre del ensayo?", respuesta: "S??, una vez creado el ensayo se accede a este y al lado del nombre habr?? un bot??n de editar que, al seleccionarlo, se desplegara un campo de texto para introducir el nuevo nombre. ")
        
        addAyuda(pregunta: "??Se puede cambiar los datos personales?", respuesta: "S??, en la pesta??a 'Perfil' podr?? cambiar el correo y la contrase??a. ")

        addAyuda(pregunta: "Contacta con nosotros", respuesta: "Si tiene alguna duda o desea realizar alguna consulta acerca de la aplicaci??n podra contactar mediante el siguiente email: crystalite@gmail.com")
        
    }
    
}
