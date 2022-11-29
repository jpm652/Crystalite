//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct VistaClasificacion: View {
    @EnvironmentObject var vm: ViewModel
    
    @State var valorAl: Double = 0.0;
    @State var valorBa: Double = 0.0;
    @State var valorCa: Double = 0.0;
    @State var valorIr: Double = 0.0;
    @State var valorMg: Double = 0.0;
    @State var valorK: Double = 0.0;

    var body: some View {
        
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack(){
                HStack {
                    Spacer().frame(height: 1)
                    
                    Button(action: { }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .padding(.horizontal,20)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Introducir ensayo").font(.title).bold()
                    Spacer().frame(height: 15)
                    Text("Nombre: ").font(.title2)
                    
                    TextField("Introducir nombre del ensayo", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading,20)
                        .frame(width: 300, height: 34)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 20)
                
                ScrollView{
                    ForEach(vm.elementoArray){
                        elementos in
                        ElementoView(elemento: elementos)
                    }
                }
                
                Button(){

                    vm.addEnsayo(persona: vm.personaArray[0], nombre: "Primer Ensayo", fecha: Date(), enProceso: false, resultado: "Cristal faro", al: vm.elementoArray[0].valor, ba: vm.elementoArray[1].valor, ca: vm.elementoArray[2].valor, ir: vm.elementoArray[3].valor, k: vm.elementoArray[4].valor, mg: vm.elementoArray[5].valor)
                    
                        
                    
                }label: {
                    Text("Clasificar cristal")
                        .frame(width: 245, height: 59)
                        .background(Color("Azul"))
                        .tint(.black)
                        .clipShape(RoundedRectangle (cornerRadius: 19))
                        .padding(.all, 15)
                        .labelStyle(TitleOnlyLabelStyle())
                }
                
                //                NavigationLink{
                //
                //
                //                }label: {
                //                    Text("Clasificar cristal")
                //                        .frame(width: 245, height: 59)
                //                        .background(Color("Azul"))
                //                        .tint(.black)
                //                        .clipShape(RoundedRectangle (cornerRadius: 19))
                //                        .padding(.all, 15)
                //                        .labelStyle(TitleOnlyLabelStyle())
                //                }
                
            }.padding(.top, -80)
        }
    }
}


//struct VistaClasificacion_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        VistaClasificacion().environmentObject()
//    }
//}
