//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct VistaClasificacion: View {
    
    // Variables
    
    @EnvironmentObject var vm: ViewModel
    @Binding var seleccion : Int
    @State var valorAl: Double = 0.0
    @State var valorBa: Double = 0.0
    @State var valorCa: Double = 0.0
    @State var valorIr: Double = 0.0
    @State var valorMg: Double = 0.0
    @State var valorK: Double = 0.0
    @State var nombreEnsayo: String = ""
    @State var resultado: String = ""
    @State var mostrarAlerta : Bool = false
    @State var valorAlerta : valorAlerta = .first
    
    // View
    
    var body: some View {
        
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack(){
                VStack(alignment: .leading) {
                    Text("Introducir ensayo")
                        .font(.title)
                        .bold()
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                    
                    Spacer().frame(height: 15)
                    Text("Nombre: ")
                        .font(.title2)
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                    
                    
                    TextField("Introducir nombre del ensayo", text: $nombreEnsayo)
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                        .padding(.leading,20)
                        .frame(width: 300, height: 34)
                        .background(vm.modoOscuro ? .black.opacity(0.55) : .white)
                        .cornerRadius(10)
                    
                    #if CrystaliteEasy
                    Text("Tipo Cristal: ")
                        .font(.title2)
                        .foregroundColor(vm.modoOscuro ? .white : .black)
                    #endif
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
                    valorMg = vm.elementoArray[4].valor
                    valorK = vm.elementoArray[5].valor
                    
                    
                    
                    if(valorAl == 0.0 || valorBa == 0.0 || valorCa == 0.0 || valorIr == 0.0 || valorK == 0.0 || valorMg == 0.0){
                        vm.addEnsayo(persona: vm.personaLogin, nombre: nombreEnsayo, fecha: Date(), enProceso: true, resultado: "En proceso", al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        
                        self.valorAlerta = .first
                        self.mostrarAlerta = true
                        self.seleccion = 1
                        
                    }else{
                        resultado = calcularResultado(al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        
                        vm.addEnsayo(persona: vm.personaLogin, nombre: nombreEnsayo, fecha: Date(), enProceso: false, resultado: resultado, al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        
                        self.valorAlerta = .second
                        self.mostrarAlerta = true
                        self.seleccion = 1
                        
                    }
                    
                }label: {
                    Text("Clasificar cristal")
                        .frame(width: 245, height: 59)
                        .background(vm.modoOscuro ? .black :Color("Azul"))
                        .tint(vm.modoOscuro ? .white : .black)
                        .clipShape(RoundedRectangle (cornerRadius: 19))
                        .padding(.all, 15)
                        .labelStyle(TitleOnlyLabelStyle())
                }.alert(isPresented: $mostrarAlerta) {
                    switch valorAlerta {
                    case .first:
                        return Alert(title: Text("Ensayo en proceso"), message: Text("Faltan datos por introducir"), dismissButton: .default(Text("Aceptar")))
                    case .second:
                        return Alert(title: Text("Cristal encontrado"), message: Text("Se ha calculado el resultado correctamente"), dismissButton: .default(Text("Aceptar")))
                    }
                }
            }.padding(.top,50)
            
        }.onAppear(){
            vm.elementoArray[0].valor = 0
            vm.elementoArray[1].valor = 0
            vm.elementoArray[2].valor = 0
            vm.elementoArray[3].valor = 0
            vm.elementoArray[4].valor = 0
            vm.elementoArray[5].valor = 0
        }
        .onDisappear(){
            nombreEnsayo = ""
            vm.elementoArray[0].valor = 0
            vm.elementoArray[1].valor = 0
            vm.elementoArray[2].valor = 0
            vm.elementoArray[3].valor = 0
            vm.elementoArray[4].valor = 0
            vm.elementoArray[5].valor = 0
        }
    }
}
