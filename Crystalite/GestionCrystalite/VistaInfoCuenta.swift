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
//    @Binding var registro : Bool = false
//    @Binding var iniciarSesion : Bool = true
    
    var body: some View {
        ZStack(alignment: .top){
            Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
            
            VStack {
                VStack {
                    
                    Toggle("Modo Oscuro", isOn: $showGreeting)
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
                    
                    Image(uiImage: UIImage(data: vm.personaLogin.foto ?? Data())!)
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .padding(5)
                    
                    
                    Text(vm.personaLogin.nombre ?? "")
                        .font(.title)
                    Divider()
                    
                    VStack(alignment: .leading) {
                        
                        HStack(alignment: .top) {
                            Text("Correo")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(vm.personaLogin.email ?? "")
                                .font(.subheadline)
                        }.padding(4)
                        
                        Divider()
                        
                        HStack(alignment: .top) {
                            Text("Contraseña")
                                .font(.subheadline)
                                .bold()
                            Spacer()
                            Text(vm.personaLogin.contrasena ?? "")
                                .font(.subheadline)
                        }.padding(4)
                        
                        Divider()
                        
                        HStack(alignment: .top) {
                            Text("Cerrar Sesión")
                                .font(.subheadline)
                                .bold()
                                .foregroundColor(.red)
                                .onTapGesture {
                                    vm.personaLogin = PersonaEntity()
                                    // VistaLogin(iniciarSesion: $iniciarSesion, registro: $registro)
                                }
                        }.padding(4)
                    }
                    .frame(width: 350)
                    .background(vm.modoOscuro ? .black : .white)
                    .cornerRadius(10)
                    .foregroundColor(vm.modoOscuro ? .white : .black)
                    
                    Spacer()
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
