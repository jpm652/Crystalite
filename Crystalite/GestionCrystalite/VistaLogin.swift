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
            ZStack{
                Color("Gris").ignoresSafeArea()
                
                VStack {
                    Image("Logo").resizable().frame(width: 180, height: 150)
                    Spacer().frame(height: 40)

                    VStack(alignment: .leading) {
                        
                        Text("Email")
                        TextField("Introducir email", text: .constant("")).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                        
                        Spacer().frame(height: 20)
                        
                        Text("Contraseña")
                        TextField("Introducir contraseña", text: .constant("")).frame(width: 272, height: 34).background(.white).cornerRadius(10)
                    }
                    
                    Spacer().frame(height: 40)

                    VStack{
                        
                        boton(texto: "Iniciar Sesión", vista: AnyView(VistaPrincipal()))
                        HStack{
                        //RELLENAR --------o---------
                        }
                        boton(texto: "Registro", vista: AnyView(VistaRegistro()));
                        
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
