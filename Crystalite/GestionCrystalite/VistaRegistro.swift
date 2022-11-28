//
//  Registro.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaRegistro: View {
    @EnvironmentObject var vm : ViewModel
    @State var imageGeneral : UIImage = (UIImage(systemName: "person.crop.circle.badge.plus") ?? nil)!
    @State var mostrarImagePicker: Bool = false
    
    // Atributos de una persona
    @State var nombre : String = ""
    @State var email : String = ""
    @State var contraseña : String = ""
    @State var repeatContraseña : String = ""

    var body: some View {
        NavigationView{
            ZStack{
                Color("Gris").ignoresSafeArea()
                
                VStack {
                    
                    Button() {
                        mostrarImagePicker.toggle()
                        
                        
                    }label:{
                        VStack{
                            Image(uiImage: imageGeneral)
                                .resizable()
                                .foregroundColor(.black)
                                .frame(width: 120, height: 100, alignment: .center)
                        }
                    }
                    .sheet(isPresented: $mostrarImagePicker){
                        ImagePicker(sourceType: .photoLibrary){imageSeleccionada in
                            imageGeneral = imageSeleccionada
                        }
                    }
                    
                    Spacer().frame(height: 50)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        Text("Nombre")
                        TextField("Introducir nombre", text: $nombre).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        Text("Email")
                        TextField("Introducir email", text: $email).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        Text("Contraseña")
                        SecureField("Introducir contraseña", text: $contraseña).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        
                        Text("Repetir Contraseña")
                        SecureField("Repetir contraseña", text: $repeatContraseña).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                    
                    Spacer().frame(height: 40)
                    
                    Button() {
                        if(nombre == "" || email == "" || contraseña == "" || repeatContraseña == ""){
                            // Poner pop up
                        }else{
                            vm.addPersona(nombre: nombre, foto: imageGeneral, email: email, contrasena: contraseña, admin: false)
                            //NavigationLink(destination: VistaLogin())
                        }
                    } label: {
                        Text("Registrarse")
                            .frame(width: 245, height: 59).background(Color("Azul")).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19))
                    }
                }
            }
        }.padding(.top, -300)
    }
}

struct VistaRegistro_Previews: PreviewProvider {
    static var previews: some View {
        VistaRegistro()
    }
}
