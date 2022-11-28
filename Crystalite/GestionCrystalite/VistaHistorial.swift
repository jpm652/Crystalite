//
//  HistorialView.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaHistorial: View {
    @EnvironmentObject var vm : ViewModel
    @State var query: String = "";
    
    enum OpcionEnsayo : String, CaseIterable{
        case todos = "Todos"
        case enProceso = "En proceso"
    }
    @State var opcionEnsayo : OpcionEnsayo = .todos
    
    var body: some View {
        
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Historial")
                    .frame(alignment: .center)
                    .font(.title);
                
                BusquedaView(text: $query)
                
                Text("Mostrar: ").frame(alignment: .leading)
                Picker("", selection: $opcionEnsayo){
                    ForEach(OpcionEnsayo.allCases, id: \.self){ opcion in
                        Text(opcion.rawValue)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                /*
                List(){
                    ForEach(vm.ensayoArray){ ensayo in
                        if(query.isEmpty){
                            Text("No hay ensayos.")
                        }else{
                            if(ensayo.nombre.contains($query)){
                                NavigationLink(destination: estudioHistorial(tipoCristal: ensayo.resultCristal, nombreEnsayo: ensayo.nombre, fecha: ensayo.fecha)){
                                    
                                }
                            }
                        }
                    }
                }
                 */
                
                // estudioHistorial(tipoCristal: "Cristal ventana vehiculo", numeroEnsayo: 1, fecha: Date());
            }.padding(.top, -80)
            
        }
    }
}

struct VistaHistorial_Previews: PreviewProvider {
    static var previews: some View {
        VistaHistorial()
    }
}
