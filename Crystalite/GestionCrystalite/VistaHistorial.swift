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
    //@State var usuarioActual: PersonaEntity
    @State var query: String = "";
    
    enum OpcionEnsayo : String, CaseIterable{
        case todos = "Todos"
        case enProceso = "En proceso"
    }
    @State var opcionEnsayo : OpcionEnsayo = .todos
    
    var body: some View {
        
        NavigationView{
            
            ZStack(alignment: .top){
                
                Color("Gris").ignoresSafeArea()
                
                HStack {
                    Spacer().frame(height: 1)
                    
                    Button(action: { }) {
                        //Text(usuarioActual.nombre ?? "")
                        Image(systemName: "person.crop.circle")//uiImage: UIImage(data: usuarioActual.foto!)!)// systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.black, lineWidth: 2))
                            .padding(.horizontal,20)
                    }
                }.padding(.top,-50)
                
                
                VStack{
                    
                    Text("Historial")
                        .frame(alignment: .center)
                        .font(.title);
                    
                    BusquedaView(text: $query)
                    
                    Spacer().frame(height: 10)
                    
                    Text("Mostrar: ").frame(alignment: .leading)
                    Picker("", selection: $opcionEnsayo){
                        
                        ForEach(OpcionEnsayo.allCases, id: \.self){ opcion in
                            Text(opcion.rawValue)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()
                    
                    ScrollView{
                        ForEach(vm.ensayoArray){ ensayo in
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

