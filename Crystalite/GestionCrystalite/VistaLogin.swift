//
//  Login.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI




struct VistaLogin: View {
    @EnvironmentObject var vm: ViewModel
    
    @State var email : String = ""
    @State var contraseña : String = ""
    var body: some View {
        
        
        
        NavigationView{
            ZStack{
                Color("Gris").ignoresSafeArea()
                
                VStack {
 
                    Image("Logo").resizable().frame(width: 180, height: 150)
                    Spacer().frame(height: 40)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Email")
                        TextField("Introducir email", text: $email)
                            .padding(.leading,10)
                            .frame(width: 272, height: 34)
                            .background(.white)
                            .cornerRadius(10)
                        
                        Spacer().frame(height: 20)
                        
                        Text("Contraseña")
                        SecureField("Introducir contraseña", text: $contraseña)
                            .padding(.leading,10)
                            .frame(width: 272, height: 34)
                            .background(.white)
                            .cornerRadius(10)
                    }
                    
                    Spacer().frame(height: 40)
                    
                    VStack{
                        
                        NavigationLink{
                            if(email.isEmpty || contraseña.isEmpty){
                                // Pop up rellene campos

                            }else{
                                ForEach(vm.personaArray) { persona in
                                    
                                    if(persona.email == email && persona.contrasena == contraseña){
                                        
                                        VistaPrincipal()
                                        
                                    }else{
                                        // Pop up datos incorrectos
                                    }
                                }
                            }
                            
                        }label: {
                            Text("Iniciar Sesión")
                                .frame(width: 245, height: 59)
                                .background(Color("Azul"))
                                .tint(.black)
                                .clipShape(RoundedRectangle (cornerRadius: 19))
                        }
                        
                    }

                    
                    HStack{
                        //RELLENAR --------o---------
                    }
                    boton(texto: "Registro", vista: AnyView(VistaRegistro()));
                    
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
