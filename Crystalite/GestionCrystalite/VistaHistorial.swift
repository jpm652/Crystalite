//
//  HistorialView.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI
import CoreData

struct VistaHistorial: View {
    
    @EnvironmentObject var vm : ViewModel
    @State var query: String = "";
    
    enum OpcionEnsayo : String, CaseIterable{
        case todos = "Todos"
        case enProceso = "En proceso"
    }
    @State var opcionEnsayo : OpcionEnsayo = .todos
    
    var body: some View {
        
        NavigationView{
            
            ZStack(alignment: .top){
                
                Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
                VStack{
                    
                    Text("Historial")
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                        .frame(alignment: .center)
                        .font(.title)
                    
                    BusquedaView(text: $query)
                    
                    Spacer().frame(height: 10)
                    
                    Text("Mostrar: ")
                        .frame(alignment: .leading)
                        .foregroundColor(vm.modoOscuro ? .white : .black)

                    Picker("", selection: $opcionEnsayo){
                        
                        ForEach(OpcionEnsayo.allCases, id: \.self){ opcion in
                            Text(opcion.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    
                    HStack{
                        Text("Fecha")
                            .foregroundColor(vm.modoOscuro ? .white : .black)
                            .padding(.leading,20)
                        Text("Ensayos")
                            .foregroundColor(vm.modoOscuro ? .white : .black)
                            .padding(.leading,20)

                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    ScrollView{
                        if let ensayoPersona = vm.personaLogin.ensayoRelation?.allObjects as? [EnsayoEntity]{
                        ForEach(ensayoPersona){ ensayo in
                            if(query.isEmpty){
                                if(opcionEnsayo == .enProceso){
                                    if(ensayo.enProceso){
                                        NavigationLink(destination: VistaEditarEnProceso(ensayo: ensayo)){
                                            estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                        }
                                    }
                                }
                                else{
                                    
                                    if(ensayo.enProceso){
                                        NavigationLink(destination: VistaEditarEnProceso(ensayo: ensayo)){
                                            estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                        }
                                    }else{
                                        NavigationLink(destination: VistaInfoDetallada(ensayo: ensayo)){
                                            estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                        }
                                    }
                                }
                                
                            }else{
                                if((ensayo.nombre ?? "" ).hasPrefix(query)){
                                    if(opcionEnsayo == .enProceso){
                                        if(ensayo.enProceso){
                                            NavigationLink(destination: VistaEditarEnProceso(ensayo: ensayo)){
                                                estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                            }
                                        }
                                    }else{
                                        if(ensayo.enProceso){
                                            NavigationLink(destination: VistaEditarEnProceso(ensayo: ensayo)){
                                                estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                            }
                                        }else{
                                            NavigationLink(destination: VistaInfoDetallada(ensayo: ensayo)){
                                                estudioHistorial(proceso: ensayo.enProceso, tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                                            }
                                        }
                                    }
                                }
                            }
                            }
                        }
                    }
                }
            }.padding(.top,-40)
            
            // estudioHistorial(tipoCristal: "Cristal ventana vehiculo", numeroEnsayo: 1, fecha: Date());
        }
        
    }
}

/*
 struct VistaHistorial_Previews: PreviewProvider {
 static var previews: some View {
 VistaHistorial()
 }
 }
 */

