//
//  VistaInfoCuenta.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaInfoCuenta: View {
    @EnvironmentObject var vm: ViewModel
    @State private var showGreeting = false

    
    var body: some View {
        ZStack(alignment: .top){
            Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
            
            VStack(){
                    VStack(){

                        Toggle(isOn: $showGreeting){
                            Text("Modo Oscuro")
                        }
                            .toggleStyle(.automatic)
                            .frame(width: 200)
                        Button(){
                            if(vm.modoOscuro){
                                vm.modoOscuro = false
                            }else{
                                vm.modoOscuro = true
                            }
                        }label:{
                            Text("Modo Oscuro")
                        }
                            
                        
            }.padding(.top,100)
                    .padding(.trailing,20)
                VStack {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 75, height: 75)
                            .padding(.horizontal,20)
                    
                    Text(vm.personaLogin.nombre ?? "")
                }.padding(.top,25)
                
                Spacer().frame(height: 25)
                VStack{
                    
                }
            }.padding(.top, -80)
        }
    }
}

struct VistaInfoCuenta_Previews: PreviewProvider {
    static var previews: some View {

             VistaInfoCuenta()
     }
 }
