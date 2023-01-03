//
//  ViewDescripcionElemento.swift
//  Crystalite
//
//  Created by Aula11 on 30/12/22.
//

import SwiftUI

struct ViewDescripcionElemento: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var elemento : ElementoEntity
    
    var body: some View{
        
        ZStack(){
            Color("Gris").ignoresSafeArea()
            
            Circle()
                .fill(Color("Azul"))
                .frame(width: 500, height: 500)
                .padding(.top,-500)
            
            VStack(alignment: .center){
                Image(elemento.iniciales ?? "")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.top,50)
                
                Text(elemento.nombre ?? "").font(.title2)
                    .padding(.top, 100)
                    .foregroundColor(vm.modoOscuro ? .white : .black)
                
                Divider()
                    .foregroundColor(vm.modoOscuro ? .white : .black)
                
                Text(elemento.descripcion ?? "")
                    .padding(.horizontal, 100)
                    .multilineTextAlignment(.center)
                    .foregroundColor(vm.modoOscuro ? .white : .black)
                
                
            }
        }
        
    }
    
    
}

// @State var width = UIScreen.main.bounds.width

