//
//  Componentes.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import Foundation
import SwiftUI

struct boton: View{
    
    var texto : String;
    var vista : String;
    
    var body:some View{
        
        Button() {
        } label: {
            Text(texto)
                .frame(width: 245, height: 59).background(Color("Azul")).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19)).padding(.all, 15)
        }
    }
}

struct ElementoView: View{
    
    var iniciales : String;
    var nombre : String;
    var value = "0,0";
    
    var body:some View{
        HStack (){
            Image(systemName: "gear")
            VStack(alignment: .leading) {
                Text(iniciales)
                Text(nombre)
                
            }.frame(width: 170, alignment: .leading)
            TextField(value, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
            Image(systemName: "plus.circle")
        }
        .frame(width: 300, height: 60)
        .background(.white)
        .cornerRadius(15)
    }
}

struct elementoCristal: View{
    
    var body: some View{
        Text("");
    }
}


