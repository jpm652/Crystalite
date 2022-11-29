//
//  VistaInfoDetallada.swift
//  Crystalite
//
//  Created by David Silvente on 26/11/22.
//

import SwiftUI

struct VistaInfoDetallada: View {
    @EnvironmentObject var vm: ViewModel
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
            
                ScrollView{
                    elementoResultadoFila(iniciales: "Al", nombre: "Aluminio", value: vm.ensayoArray[0].al)
                    elementoResultadoFila(iniciales: "Ba", nombre: "Bario", value: vm.ensayoArray[0].ba)
                    elementoResultadoFila(iniciales: "Ca", nombre: "Calcio", value: vm.ensayoArray[0].ca)
                    elementoResultadoFila(iniciales: "IR", nombre: "Indice Refraccion", value: vm.ensayoArray[0].ir)
                    elementoResultadoFila(iniciales: "K", nombre: "Potasio", value: vm.ensayoArray[0].k)
                    elementoResultadoFila(iniciales: "Mg", nombre: "Magnesio", value: vm.ensayoArray[0].mg)
                }


                
                
        }
    }
    }
}

struct VistaInfoDetallada_Previews: PreviewProvider {
    static var previews: some View {
        VistaInfoDetallada()
    }
}
