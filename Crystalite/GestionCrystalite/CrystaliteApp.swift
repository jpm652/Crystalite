//
//  CrystaliteApp.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

@main
struct CrystaliteApp: App {
    @StateObject private var vm: ViewModel = ViewModel()
    @State var iniciarSesion : Bool = false
    @State var registro : Bool = false

    var body: some Scene {
        WindowGroup {
            if(iniciarSesion == false && registro == false){
                VistaLogin(iniciarSesion: $iniciarSesion, registro: $registro).environmentObject(vm)
            }
            if (iniciarSesion == true){
                VistaPrincipal(selec: 1, iniciarSesion: $iniciarSesion).environmentObject(vm)
            }
            if (registro == true && iniciarSesion == false){
                VistaRegistro(registro: $registro, iniciarSesion: $iniciarSesion).environmentObject(vm)
            }
        }
    }
}
