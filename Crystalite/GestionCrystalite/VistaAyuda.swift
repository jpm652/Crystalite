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
                        Section(header: preguntas(preguntas: "¿Cómo se puede añadir un ensayo?")){
                        respuestas(respuestas: "Para realizar un ensayo se tiene que ir al apartado de Clasificación y rellenar los datos que se le pide y por último darle al botón de Clasificar Cristal")
                        }
                            Section(header: preguntas(preguntas: "¿Qué pasa si dejo un campo vacío?")){
                            respuestas(respuestas: "Si se deja un campo vacío no pasa nada, ya que el si le das a Clasificar Cristal, se te guardará pero aun no estará terminado y en la vista Historial te aparecerá como que está en proceso")
                        }
                            Section(header: preguntas(preguntas: "¿Se puede cambiar el nombre del ensayo?")){
                            respuestas(respuestas: "Sí, una vez creado el ensayo accedes a dicho ensayo y tendrás un botón de editar con el cual podrás cambiar el nombre")
                        }
                            Section(header: preguntas(preguntas: "Contacta con nosotros")){
                            respuestas(respuestas: "Si tienes alguna duda sobre la aplicación contacta al siguiente mail: crystalite@gmail.com")
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
