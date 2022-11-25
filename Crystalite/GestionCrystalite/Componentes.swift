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
    var vista : AnyView;
    
    var body:some View{
        
        
        NavigationLink(destination: vista){
            Label(texto, systemImage: "app.badge")
                    .frame(width: 245, height: 59)
                    .background(Color("Azul"))
                    .tint(.black)
                    .clipShape(RoundedRectangle (cornerRadius: 19))
                    .padding(.all, 15)
                    .labelStyle(TitleOnlyLabelStyle())

            }
    }
}

struct ElementoView: View{
    
    var iniciales : String;
    var nombre : String;
    var valor : Double;
    
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
            TextField(String(valor), text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
            Button{
                
            }label: {
                Image(systemName: "plus.circle")
            }
        }
        .frame(width: 300, height: 60)
        .background(.white)
        .cornerRadius(15)
    }
}

struct estudioHistorial: View{
    
    var tipoCristal: String;
    var numeroEnsayo: Int;
    var fecha: Date;

    var body:some View{
        ZStack{
            Color("Gris").ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Label("Fecha", systemImage: "circle.inset.filled")
                    HStack (){
                        
                        VStack(alignment: .leading) {
                            Text(tipoCristal).font(.title3)
                            Text("Ensayo Nº \(numeroEnsayo)").font(.caption)
                            
                        }.padding(.leading)
                            .frame(width: 170, alignment: .leading)
                        
                        Image(tipoCristal)
                            .resizable()
                            .frame(width: 125, height: 100)
                            .clipShape(RoundedRectangle (cornerRadius: 10))
                        
                    }
                    .frame(width: 300, height: 100)
                    .background(.white)
                    .cornerRadius(15)
                }
            }
            
            
        }
    }
}

struct elementoCristal: View{
    
    var tipo : String;
    var nombre : String;
    var fecha : String;
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(tipo).font(.title2);
                Text(nombre).font(.title3);
                Text(fecha);
            }.frame(width: 180, height: 100, alignment: .leading)
            Image("Cristal vidrio botella")
                .resizable()
                .frame(width: 125, height: 100, alignment: .trailing)
                .cornerRadius(15);
        }
        .frame(width: 300, height: 100)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct elementoResultadoFila: View{
    
    var iniciales : String;
    var nombre : String;
    var value = "0,0";
    
    var body: some View{
        HStack (){
            Image(systemName: "gear")
            VStack(alignment: .leading) {
                Text(iniciales)
                Text(nombre)
                
            }.frame(width: 170, alignment: .leading)
            Text(value).frame(width: 30)
        }
        .frame(width: 300, height: 60)
        .background(.white)
        .cornerRadius(15)
    }
    
}



