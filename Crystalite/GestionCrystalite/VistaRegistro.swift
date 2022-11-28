//
//  Registro.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaRegistro: View {
    @State var imageGeneral : UIImage = (UIImage(systemName: "person.crop.circle.badge.plus") ?? nil)!
    @State var mostrarImagePicker: Bool = false


    var body: some View {
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
                    TextField("Introducir nombre", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)                            .padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Email")
                    TextField("Introducir email", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Contraseña")
                    TextField("Introducir contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                
                VStack(alignment: .leading, spacing: 1) {
                    Text("Repetir Contraseña")
                    TextField("Repetir contraseña", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).padding(.leading,10).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                }.frame(width: 272, height: 58, alignment: .center).padding(.bottom, 10)
                
                Spacer().frame(height: 40)
                
                Button() {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label: {
                    Text("Registrarse")
                        .frame(width: 245, height: 59).background(Color("Azul")).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19))
                }
            }
        }
    }
}

struct VistaRegistro_Previews: PreviewProvider {
    static var previews: some View {
        VistaRegistro()
    }
}
