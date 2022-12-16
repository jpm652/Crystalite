//
//  VistaInfoDetallada.swift
//  Crystalite
//
//  Created by David Silvente on 26/11/22.
//

import SwiftUI

struct VistaInfoDetallada: View {
    @EnvironmentObject var vm: ViewModel
    @State var disposicion : Bool = false
    @State var cambiarNomEnsayo : Bool = false
    @State var currentNomEnsayo : String = ""
    //@State var idEnsayo : Int
    @State var ensayo : EnsayoEntity
    var body: some View {
        
        

        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Informacion detallada").font(.title);
                
                Spacer().frame(height: 30)
                elementoCristalEdicion(tipoCristal: ensayo.resultCristal ?? "Ensayo",nombreEnsayo: ensayo.nombre ?? "nombre", fecha: "11/02/23", ensayo: ensayo)
                
                Spacer().frame(height: 50)
                HStack{
                    Text("Variables usadas (6)");
                    Spacer().frame(width: 110);
                    
                    Button(){
                        disposicion.toggle()
                    }label: {
                        Image(systemName: disposicion ? "list.dash" : "square.grid.3x3.topleft.filled")
                            .foregroundColor(.black)
                    }
                    
                }.frame(width: 300, alignment: .leading)
            
                if disposicion == false{
                    ScrollView{
                        elementoResultadoFila(iniciales: "Al", nombre: "Aluminio", value: ensayo.al)
                        elementoResultadoFila(iniciales: "Ba", nombre: "Bario", value: ensayo.ba)
                        elementoResultadoFila(iniciales: "Ca", nombre: "Calcio", value: ensayo.ca)
                        elementoResultadoFila(iniciales: "RI", nombre: "Indice Refraccion", value: ensayo.ir)
                        elementoResultadoFila(iniciales: "K", nombre: "Potasio", value: ensayo.k)
                        elementoResultadoFila(iniciales: "Mg", nombre: "Magnesio", value: ensayo.mg)
                    }
                }else{
                    HStack{
                        elementoResultadoCuadrado(iniciales: "Al", value: ensayo.al)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ba", value: ensayo.ba)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ca",  value: ensayo.ca)
                    }
                    Spacer().frame(height: 30)

                    HStack{
                        elementoResultadoCuadrado(iniciales: "RI", value: ensayo.ir)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "K", value: ensayo.k)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Mg",value: ensayo.mg)
                    }
                }
            }.padding(.top,-50)
    }
    }
}

/*struct VistaInfoDetallada_Previews: PreviewProvider {
    static var previews: some View {
        VistaInfoDetallada()
    }
}*/
