//
//  VistaInfoDetallada.swift
//  Crystalite
//
//  Created by David Silvente on 26/11/22.
//

import SwiftUI

struct VistaInfoDetallada: View {
    var body: some View {
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Informacion detallada").font(.title);
                
                Spacer().frame(height: 30)
                elementoCristalEdicion(tipoCristal: "Cristal ventana vehiculo", numeroEnsayo: 3, fecha: "11/02/23")
            
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

struct VistaInfoDetallada_Previews: PreviewProvider {
    static var previews: some View {
        VistaInfoDetallada()
    }
}
