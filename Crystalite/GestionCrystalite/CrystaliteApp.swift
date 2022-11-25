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
    
    var body: some Scene {
        WindowGroup {
            VistaLogin().environmentObject(vm)
        }
    }
}
