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

            Color("Gris").ignoresSafeArea()
            
            HStack {
                Spacer().frame(height: 1)
                
                Button(action: { }) {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .padding(.horizontal,20)
                }
            }.padding(.top, -30)
            
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
                               
                
                    List(){
                        ForEach(vm.ensayoArray){ ensayo in
                            if(query.isEmpty){
                                NavigationLink(destination: VistaInfoDetallada()){
                                    estudioHistorial(tipoCristal: ensayo.resultCristal ?? "", nombreEnsayo: ensayo.nombre ?? "", fecha: ensayo.fecha ?? Date())
                            }
                            }
                            
                        }
                    }
                }
                 
                // estudioHistorial(tipoCristal: "Cristal ventana vehiculo", numeroEnsayo: 1, fecha: Date());
            }
        }.padding(.top, -300)
    }
}

struct VistaHistorial_Previews: PreviewProvider {
    static var previews: some View {
        VistaHistorial()
    }
}
