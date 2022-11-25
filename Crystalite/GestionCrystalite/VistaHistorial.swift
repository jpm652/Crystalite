//
//  HistorialView.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaHistorial: View {
    var body: some View {
        elementoCristal();
    }
}


struct estudioHistorial: View{
    
    var iniciales : String;
    var nombre : String;
    var value = "0,0";
    
    var body:some View{
        HStack (){
            Image(iniciales)
                .resizable()
                .frame(width: 35, height: 35)
                .clipShape(RoundedRectangle (cornerRadius: 10))

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



struct VistaHistorial_Previews: PreviewProvider {
    static var previews: some View {
        VistaHistorial()
    }
}
