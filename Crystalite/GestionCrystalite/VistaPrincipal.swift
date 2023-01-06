//
//  Principal.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaPrincipal: View {
    @EnvironmentObject var vm: ViewModel;
    @State var selec: Int
    @State var seleccion: Int = 1;
    @Binding var iniciarSesion: Bool
        
    
    
    var body: some View {
        
        TabView(selection: $selec) {
            VistaClasificacion(seleccion: $selec)
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
            VistaInfoCuenta(iniciarSesion: $iniciarSesion)
                .tabItem{
                    Image(systemName: "person.crop.circle")
                    Text("Perfil")
                }.tag(3)
        }
        .accentColor(vm.modoOscuro ? .white : Color("Morado"))
        .background(vm.modoOscuro ? .black : Color("Gris"))
    }

}
//struct VistaPrincipal_Previews: PreviewProvider {
//    static var previews: some View {
//        VistaPrincipal().environmentObject(ViewModel)
//    }
//}
