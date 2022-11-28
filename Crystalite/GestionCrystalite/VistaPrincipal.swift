//
//  Principal.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaPrincipal: View {
    @EnvironmentObject var usuario: ViewModel;
    //var usuarioActual: PersonaEntity
    
    @State var seleccion: Int = 1;
    
    var body: some View {
        
        TabView(selection: $seleccion) {
            VistaClasificacion()
                .tabItem{
                    Image(systemName: "doc.badge.plus")
                    Text("Clasificación")
                }.tag(0)
            VistaHistorial()
                .tabItem{
                    Image(systemName: "clock.arrow.circlepath")
                    Text("Historial")
                }.tag(1)
            VistaAyuda()
                .tabItem{
                    Image(systemName: "lifepreserver")
                    Text("Ayuda")
                }.tag(2)
        }
        .background(Color("Gris"))
        .accentColor(Color("Morado"))
    }
}

//struct VistaPrincipal_Previews: PreviewProvider {
//    static var previews: some View {
//        VistaPrincipal().environmentObject(ViewModel)
//    }
//}
