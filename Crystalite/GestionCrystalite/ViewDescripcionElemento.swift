//
//  ViewDescripcionElemento.swift
//  Crystalite
//
//  Created by Aula11 on 30/12/22.
//

import SwiftUI

struct ViewDescripcionElemento: View {
    @Binding var elemento : ElementoEntity
    
    var body: some View{
        
        ZStack(){
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
                Divider()
                Text(elemento.descripcion ?? "")
                    .padding(.horizontal, 100)
                    .multilineTextAlignment(.center)
                
            }
            }
            
        }
        
        
    }
    
    // @State var width = UIScreen.main.bounds.width
  
