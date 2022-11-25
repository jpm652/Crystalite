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
        ZStack{
            Color("Gris").ignoresSafeArea()
            
            NavigationView{
                VStack{
                    List(){
                        ForEach(vm.ayudaArray){ ayuda in
                            Section(header: preguntasView(ayuda: ayuda).environmentObject(vm)){
                                //respuestasView(ayuda: ayuda).environmentObject(vm)
                            }
                        }
                    }
                }
            }.navigationTitle("Preguntas frecuentes")
        }
    }
}

struct preguntasView: View{
    @EnvironmentObject var vm: ViewModel
    var ayuda: AyudaEntity
    
    var body: some View{
        Text(ayuda.pregunta!).frame(width: 300, height: 50).background(.white).cornerRadius(10)
    }
}


struct respuestasView: View{
    @EnvironmentObject var vm: ViewModel
    var ayuda: AyudaEntity
    
    var body: some View{
        Text(ayuda.respuesta!).frame(width: 300, height: 150).background(.white).cornerRadius(10)
    }
}

struct VistaAyuda_Previews: PreviewProvider {
    static var previews: some View {
        VistaAyuda()
    }
}
