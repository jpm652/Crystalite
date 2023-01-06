//
//  VistaAyuda.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaAyuda: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top){
                Color("Gris").ignoresSafeArea()
                VStack{
                    Text("Ayuda")
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                        .frame(alignment: .center)
                        .font(.title)
                    List(){
                        Section(header: preguntas(preguntas: "¿Como se puede añadir un ensayo?")){
                        respuestas(respuestas: "Para realizar un ensayo se tiene que ir al apartado de Clasificacion y rellenar los datos que se le pide y por ultimo darle al boton de Clasificar Cristal")
                        }
                            Section(header: preguntas(preguntas: "¿Que pasa si dejo un campo vacio?")){
                            respuestas(respuestas: "Si se deja un campo vacio no pasa nada, ya que el si le das a Clasificar Cristal, se te guardara pero aun no estara terminado y en la vista Historial te aparecera como que esta en proceso")
                        }
                            Section(header: preguntas(preguntas: "¿Se puede cambiar el nombre del ensayo?")){
                            respuestas(respuestas: "Si, para ello una vez creado el ensayo accedes a dicho ensayo y tendras un boton de editar con el cual podras cambiarle el nombre")
                        }
                            Section(header: preguntas(preguntas: "Contacta con nosotros")){
                            respuestas(respuestas: "Si tienes alguna duda sobre la aplicacion contacta al siguiente mail: crystalite@gmail.com")
                        }
                    }
                }
            }.padding(.top,-60)
            
        }
                   
    }
}

struct VistaAyuda_Previews: PreviewProvider {
    static var previews: some View {
        VistaAyuda()
    }
}
