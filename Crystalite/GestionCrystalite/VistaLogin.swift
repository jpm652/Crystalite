//
//  Login.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaLogin: View {
    
    var body: some View {
        NavigationView{
            ZStack{ Color("Gris").ignoresSafeArea()
                VStack {
                    Image("Logo").resizable().frame(width: 350, height: 350, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Email")
                        TextField("Introducir email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                        
                    }.frame(width: 272, height: 58, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 1) {
                        Text("Contraseña")
                        TextField("Introducir contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }.frame(width: 272, height: 58, alignment: .center)
                    
                    
                    boton(texto: "Iniciar Sesión", vista: "VistaPrincipal();");
                    
                    Divider()
                    
                    NavigationLink(destination: VistaRegistro()){
                        Button() {
                        } label: {
                            Text("Registrarse")
                                .frame(width: 245, height: 59).background(Color("Azul")).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19)).padding(.all, 15)
                        }
                    }
                }
                
            }
        }
    }
}

struct VistaLogin_Previews: PreviewProvider {
    static var previews: some View {
        VistaLogin()
    }
}
