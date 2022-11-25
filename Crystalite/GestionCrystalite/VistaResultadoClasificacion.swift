//
//  VistaResultadoClasificacion.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaResultadoClasificacion: View {
    var body: some View {
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Resultado Clasifiaccion").font(.title);
                
                Spacer().frame(height: 30)
                elementoCristal2(tipo: "Cristal Ventana", nombre: "Ensayo N", fecha: "Fecha");
            
                Spacer().frame(height: 50)
                HStack{
                    Text("Variables usadas (6)");
                    Spacer().frame(width: 110);
                    
                    Button(){
                        
                    }label: {
                        Image(systemName: "seal.fill")
                    }
                    
                }.frame(width: 300, alignment: .leading)
            
                elementoResultadoFila(iniciales: "Mg", nombre: "Magnesio");
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
