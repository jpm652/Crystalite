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
            ZStack{
                Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
                VStack{
                    List() {
                        Section(header: preguntas(preguntas: "¿Como se puede añadir un ensayo?")){
                            respuestas(respuestas: "Solucion a la pregunta")
                        }
                    }
                }
            }
        }
    }
}

struct VistaAyuda_Previews: PreviewProvider {
    static var previews: some View {
        VistaAyuda()
    }
}
