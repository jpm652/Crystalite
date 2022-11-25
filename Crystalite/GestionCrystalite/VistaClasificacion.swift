//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct VistaClasificacion: View {
    var body: some View {
        ZStack{
            Color("Gris").ignoresSafeArea()
            
            VStack (){
                HStack {
                    Spacer().frame(height: 1)
                    
                    Button(action: { }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 50, height: 50)
                            .padding(.horizontal,20)
                    }
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Introducir ensayo").font(.title)
                    Spacer().frame(height: 1)
                    Text("Ensayo").font(.title2)
                    
                    TextField("Introducir nombre del ensayo", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .padding(.leading,20)
                        .frame(width: 300, height: 34)
                        .background(.white)
                        .cornerRadius(10)
                }
                Spacer().frame(height: 25)

                
                ElementoView(iniciales: "RI", nombre: "Índice de Refracción");
                ElementoView(iniciales: "Mg", nombre: "Magnesio");
                ElementoView(iniciales: "Al", nombre: "Aluminio");
                ElementoView(iniciales: "K", nombre: "Potasio");
                ElementoView(iniciales: "Ca", nombre: "Calcio");
                ElementoView(iniciales: "Ba", nombre: "Bario");
                
                //boton(texto: "Clasificar cristal", vista: "");
                
                Spacer()
            }
            
            
            
            
        }
    }
}

struct VistaClasificacion_Previews: PreviewProvider {
    static var previews: some View {
        VistaClasificacion()
    }
}
