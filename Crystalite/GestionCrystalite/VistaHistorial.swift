//
//  HistorialView.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI
import CoreData

struct VistaHistorial: View {
    
    // Variables
    
    @EnvironmentObject var vm : ViewModel
    @State var query: String = ""
    @State var opcionEnsayo : OpcionEnsayo = .todos
    
    // View
    
    var body: some View {
        
        NavigationView{
            
            ZStack(alignment: .top){
                
                Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
                
                VStack{
                    VStack{

                        Text("Historial")
                            .foregroundColor(vm.modoOscuro ? .white : .black)
                            .frame(alignment: .center)
                            .font(.title)
                        
                        BusquedaView(text: $query)
                        
                        Spacer().frame(height: 10)
                    }.padding(.top, -30)
                    
                    HStack(){
                        Text("Mostrar: ")
                            .frame(alignment: .leading)
                            .foregroundColor(vm.modoOscuro ? .white : .black)
                            .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 20)
                    
                    
                    Picker("", selection: $opcionEnsayo){
                        
                        ForEach(OpcionEnsayo.allCases, id: \.self){ opcion in
                            Text(opcion.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .padding(.top, -20)
                    
                    
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
                            
                            if(ensayoPersona.isEmpty){
                                
                                VStack{
                                    Image(systemName: "exclamationmark.triangle")
                                        .resizable()
                                        .frame(width: 120, height: 120)
                                        .foregroundColor(.red)
                                    Text("Actualmente no hay ensayos")
                                }
                                .padding(.top, 120)
                                .frame(alignment: .center)
                                
                            }else{
                                
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
                }
            }.padding(.top,-60)
        }
        
    }
}

enum OpcionEnsayo : String, CaseIterable{
    case todos = "Todos"
    case enProceso = "En proceso"
}
