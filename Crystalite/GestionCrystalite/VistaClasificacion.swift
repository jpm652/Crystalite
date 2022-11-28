//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct VistaClasificacion: View {
    @EnvironmentObject var vm: ViewModel
    @State var valorElemento : Double = 0.0;
    @State var valorFinal : Double = 0.0;
    
    var body: some View {
        
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack(){
                HStack {
                    Spacer().frame(height: 1)
    
                    Button(action: { }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .padding(.horizontal,20)
                    }
                }
                
                VStack(alignment: .leading) {
                    Text("Introducir ensayo").font(.title).bold()
                    Spacer().frame(height: 15)
                    Text("Nombre: ").font(.title2)
                    
                    TextField("Introducir nombre del ensayo", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading,20)
                        .frame(width: 300, height: 34)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 20)
                
                ScrollView{
                    ElementoView(iniciales: "Al", nombre: "Aluminio", valor: 0.0)
                    ElementoView(iniciales: "Ba", nombre: "Bario", valor: 0.0)
                    ElementoView(iniciales: "Ca", nombre: "Calcio", valor: 0.0)
                    ElementoView(iniciales: "Mg", nombre: "Magnesio", valor: 0.0)
                    ElementoView(iniciales: "K", nombre: "Potasio", valor: 0.0)
                    ElementoView(iniciales: "RI", nombre: "Índice de Refracción", valor: 0.0)
                }
                
                NavigationLink(destination: VistaResultadoClasificacion()){
                    Label("Clasificar cristal", systemImage: "app.badge")
                        .frame(width: 245, height: 59)
                        .background(Color("Azul"))
                        .tint(.black)
                        .clipShape(RoundedRectangle (cornerRadius: 19))
                        .padding(.all, 15)
                        .labelStyle(TitleOnlyLabelStyle())
                        .onTapGesture {
                            
                        }
                    
                    
                    
                }
                
            }.padding(.top, -80)
        }
    }
}


//struct VistaClasificacion_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        VistaClasificacion().environmentObject()
//    }
//}
