//
//  Registro.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct Registro: View {
    var body: some View {
        ZStack{ Color(red: 0.898, green: 0.918, blue: 0.961).ignoresSafeArea()
            VStack {
                Image("").resizable().frame(width: 250, height: 250, alignment: .center)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Nombre")
                    TextField("Introducir nombre", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(15)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Email")
                    TextField("Introducir email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(15)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Contraseña")
                    TextField("Introducir contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(15)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                VStack(alignment: .leading, spacing: 1) {
                    Text("Repetir Contraseña")
                    TextField("Repetir contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(15)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                
                
                Button() {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label: {
                    Text("Registrarse")
                        .frame(width: 245, height: 59).background(Color(red: 160/255, green: 210/255, blue: 235/255)).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19)).padding(.top, 40)
                }
            }
        }
    }
}

struct Registro_Previews: PreviewProvider {
    static var previews: some View {
        Registro()
    }
}
