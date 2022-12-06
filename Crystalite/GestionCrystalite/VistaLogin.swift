//
//  Login.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI


enum valorAlerta {
    case first, second
}

struct VistaLogin: View {
    @EnvironmentObject var vm: ViewModel
    @Binding var iniciarSesion : Bool
    @Binding var registro : Bool
    @State var mostrarAlerta : Bool = false
    @State var valorAlerta : valorAlerta = .first
    @State var email : String = ""
    @State var contraseña : String = ""
    // @State var persona: PersonaEntity = new PersonaEntity
    
    var body: some View {
        
        
        
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
                    
                    Button {
                        if(email == "" || contraseña == ""){
                            // Poner pop up
                            self.valorAlerta = .first
                            self.mostrarAlerta = true
                        }else{
                            for persona in vm.personaArray{
                                if(email == persona.email && contraseña == persona.contrasena){
                                    iniciarSesion.toggle()
                                    // self.persona = persona
                                }else {
                                    self.valorAlerta = .second
                                    self.mostrarAlerta = true
                                }
                            }
                        }
                    } label: {
                        Text("Iniciar Sesión")
                            .frame(width: 245, height: 59)
                            .background(Color("Azul"))
                            .tint(.black)
                                .clipShape(RoundedRectangle (cornerRadius: 19))
                        }.alert(isPresented: $mostrarAlerta) {
                            switch valorAlerta {
                            case .first:
                                return Alert(title: Text("Faltan campos por rellenar"), message: Text("Rellene todos los campos"), dismissButton: .default(Text("Vale")))
                            case .second:
                                return Alert(title: Text("Credenciales incorrectas"), message: Text("Vuelve a intentarlo"), dismissButton: .default(Text("Vale")))
                            }
                        }
                        HStack{
                            //RELLENAR --------o---------
                            Text("-----------------o-----------------")
                        }
                        Button {
                            registro.toggle()
                        } label: {
                            Text("Registro")
                                .frame(width: 245, height: 59)
                                .background(Color("Azul"))
                                .tint(.black)
                                .clipShape(RoundedRectangle (cornerRadius: 19))
                        }
                        
                        if (iniciarSesion == true){
                            VistaPrincipal()  // usuarioActual: persona)
                        }
                        if (registro == true) {
                            VistaRegistro(registro: $registro, iniciarSesion: $iniciarSesion)
                        }
                        
                    }
                }
            }
            
            
        }
        
    
}

/*struct VistaLogin_Previews: PreviewProvider {
    static var previews: some View {
        VistaLogin(iniciarSesion: .constant(false), registro: .constant(false))
    }
}*/
