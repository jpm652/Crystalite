//
//  VistaEditarEnProceso.swift
//  Crystalite
//
//  Created by Aula11 on 28/12/22.
//

import SwiftUI

struct VistaEditarEnProceso: View {
    @EnvironmentObject var vm: ViewModel
    
    @State var valorAl: Double = 0.0;
    @State var valorBa: Double = 0.0;
    @State var valorCa: Double = 0.0;
    @State var valorIr: Double = 0.0;
    @State var valorMg: Double = 0.0;
    @State var valorK: Double = 0.0;
    @State var nombreEnsayo: String = ""
    @State var ensayo: EnsayoEntity
    
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

                    Text("Ensayo en Proceso").font(.title).bold()
                    Spacer().frame(height: 15)
                    Text("Nombre: ").font(.title2)
                    
                    TextField("Introducir nombre del ensayo", text: $nombreEnsayo)
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
                    
                    valorAl = vm.elementoArray[0].valor
                    valorBa = vm.elementoArray[1].valor
                    valorCa = vm.elementoArray[2].valor
                    valorIr = vm.elementoArray[3].valor
                    valorK = vm.elementoArray[4].valor
                    valorMg = vm.elementoArray[5].valor

           
                    
                        if(valorAl == 0.0 || valorBa == 0.0 || valorCa == 0.0 || valorIr == 0.0 || valorK == 0.0 || valorMg == 0.0){
                            vm.editEnsayoEnProceso(ensayo: ensayo, nombrenuevo: nombreEnsayo, enProceso: true, resultado: "En proceso", al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        }else{
                            vm.editEnsayoEnProceso(ensayo: ensayo, nombrenuevo: nombreEnsayo, enProceso: false, resultado: "Cristal faro", al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        }
                    
                }label: {
                    Text("Clasificar cristal")
                        .frame(width: 245, height: 59)
                        .background(Color("Azul"))
                        .tint(.black)
                        .clipShape(RoundedRectangle (cornerRadius: 19))
                        .padding(.all, 15)
                        .labelStyle(TitleOnlyLabelStyle())
                }
                
            }
        }.onAppear(){
            nombreEnsayo = ensayo.nombre ?? ""
            vm.elementoArray[0].valor = ensayo.al
            vm.elementoArray[1].valor = ensayo.ba
            vm.elementoArray[2].valor = ensayo.ca
            vm.elementoArray[3].valor = ensayo.ir
            vm.elementoArray[4].valor = ensayo.k
            vm.elementoArray[5].valor = ensayo.mg
        }.padding(.top,-95)
            .onDisappear(){
                vm.elementoArray[0].valor = 0
                vm.elementoArray[1].valor = 0
                vm.elementoArray[2].valor = 0
                vm.elementoArray[3].valor = 0
                vm.elementoArray[4].valor = 0
                vm.elementoArray[5].valor = 0
            }
        
    }
    
}

