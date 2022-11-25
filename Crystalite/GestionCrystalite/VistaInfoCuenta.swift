//
//  VistaInfoCuenta.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaInfoCuenta: View {
    @EnvironmentObject var vm: ViewModel
    var persona: PersonaEntity
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
                            .frame(width: 50, height: 50)
                            .padding(.horizontal,20)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Image(systemName: "person.crop.circle").resizable().frame(width: 100, height: 100)
                    
                }
                VStack{
                    List(){
                        Text("")
                    }
                }
                Spacer().frame(height: 25)
        }
    }
    }
}

//struct VistaInfoCuenta_Previews: PreviewProvider {
//    static var previews: some View {
//         List(ViewModel().personaArray){
//             VistaInfoCuenta(persona: $0)
//         }
//     }
// }
