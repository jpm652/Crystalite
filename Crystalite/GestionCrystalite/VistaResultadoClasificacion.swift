//
//  VistaResultadoClasificacion.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaResultadoClasificacion: View {
    var body: some View {
        ZStack{
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Resultado Clasifiaccion").font(.title);
                
                Spacer().frame(height: 30, alignment: .center)
                elementoCristal2(tipo: "Cristal Ventana", nombre: "Ensayo N", fecha: "Fecha");
            
            }
            
            VStack{
                HStack{
                    Text("Variables usadas (6)");
                    Button(){
                        
                    }label: {
                        Image(systemName: "seal.fill")
                    }
                }
            }
        }
    }
}

struct VistaResultadoClasificacion_Previews: PreviewProvider {
    static var previews: some View {
        VistaResultadoClasificacion()
    }
}

struct elementoCristal2: View{
    
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
            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100, alignment: .trailing)
                .cornerRadius(15);
        }
        .frame(width: 300, height: 100)
        .background(Color.white)
        .cornerRadius(15)
    }
}
