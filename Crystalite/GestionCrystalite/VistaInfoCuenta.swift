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
    @State var iniciarSesion : Bool = true
    @State var registro : Bool = false
    
    var body: some View {
        ZStack(alignment: .top){
            Color(vm.modoOscuro ? "Gris_Oscuro" : "Gris").ignoresSafeArea()
            
            //.padding(.top,100)
            //.padding(.trailing,20)
            
            
            VStack {
                
                Image(uiImage: UIImage(data: vm.personaLogin.foto ?? Data())!)
                    .resizable()
                    .frame(width: 150, height: 150, alignment: .center)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .padding(5)
                
                VStack(alignment: .leading) {
                    Form{
                        
                        Section(header: Text("Información Básica")){
                            
                            HStack(alignment: .top) {
                                Text(vm.personaLogin.nombre ?? "")
                                    .font(.title3)
                                    .bold()
                            }
                            
                            HStack(alignment: .top) {
                                Text("Correo")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text(vm.personaLogin.email ?? "")
                                    .font(.subheadline)
                            }
                            
                            HStack(alignment: .top) {
                                Text("Contraseña")
                                    .font(.subheadline)
                                    .bold()
                                Spacer()
                                Text(vm.personaLogin.contrasena ?? "")
                                    .font(.subheadline)
                            }
                        }
                        
                        Section(header: Text("Adicional")){
                            Toggle("Modo Oscuro", isOn: $showGreeting)
                                .onChange(of: showGreeting){ value in
                                    if(value == true){
                                        vm.modoOscuro = true
                                    }else{
                                        vm.modoOscuro = false
                                    }
                                }
                                
                            
                            HStack(alignment: .top) {
                                Button(){
                                    vm.personaLogin = PersonaEntity()
                                    VistaLogin(iniciarSesion: $iniciarSesion, registro: $registro).environmentObject(vm)
                                }label:{
                                    Text("Cerra Sesión")
                                        .font(.subheadline)
                                        .bold()
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        
                    }
                    .background(vm.modoOscuro ? .black : .white)
                    .cornerRadius(10)
                    .foregroundColor(vm.modoOscuro ? .white : .black)
                    
                    Spacer()
                }
            }
            
        }
        
    }
    
}


struct VistaInfoCuenta_Previews: PreviewProvider {
    static var previews: some View {
        
        VistaInfoCuenta()
    }
}
