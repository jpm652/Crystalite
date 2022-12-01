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
    @State var cambiarNumEnsayo : Bool = false
    @State var currentNumEnsayo : String = ""
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
                        disposicion.toggle()
                    }label: {
                        Image(systemName: disposicion ? "list.dash" : "square.grid.3x3.topleft.filled")
                            .foregroundColor(.black)
                    }
                    
                }.frame(width: 300, alignment: .leading)
            
                if disposicion == false{
                    ScrollView{
                        elementoResultadoFila(iniciales: "Al", nombre: "Aluminio", value: vm.ensayoArray[2].al)
                        elementoResultadoFila(iniciales: "Ba", nombre: "Bario", value: vm.ensayoArray[2].ba)
                        elementoResultadoFila(iniciales: "Ca", nombre: "Calcio", value: vm.ensayoArray[2].ca)
                        elementoResultadoFila(iniciales: "RI", nombre: "Indice Refraccion", value: vm.ensayoArray[2].ir)
                        elementoResultadoFila(iniciales: "K", nombre: "Potasio", value: vm.ensayoArray[2].k)
                        elementoResultadoFila(iniciales: "Mg", nombre: "Magnesio", value: vm.ensayoArray[2].mg)
                    }
                }else{
                    HStack{
                        elementoResultadoCuadrado(iniciales: "Al", value: vm.ensayoArray[2].al)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ba", value: vm.ensayoArray[2].ba)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ca",  value: vm.ensayoArray[2].ca)
                    }
                    Spacer().frame(height: 30)

                    HStack{
                        elementoResultadoCuadrado(iniciales: "RI", value: vm.ensayoArray[2].ir)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "K", value: vm.ensayoArray[2].k)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Mg",value: vm.ensayoArray[2].mg)
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
