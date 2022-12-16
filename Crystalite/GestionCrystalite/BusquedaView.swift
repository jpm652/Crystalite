//
//  BusquedaView.swift
//  Crystalite
//
//  Created by Aula11 on 28/11/22.
//

import SwiftUI

struct BusquedaView: View {
    @Binding var text : String
    
    var body: some View {
        ZStack{
            Rectangle().background(.white)
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(text.isEmpty ? Color(.gray).opacity(0.5) : Color(UIColor.gray).opacity(1))
                TextField("Buscar ensayo ...", text:  $text)
                    .disableAutocorrection(true)
                    .foregroundColor(.gray)
                Button(){
                    text = ""
                }label: {
                    Image(systemName: "x.circle")
                        .foregroundColor(.gray)
                        .opacity(text.isEmpty ? 0.0 : 1)
                        .padding(.trailing,10)
                }
            }
            .foregroundColor(.white)
            .padding(.leading, 13)
        }
        .foregroundColor(.white)
        .frame(width: 330, height: 40, alignment: .leading)
        .cornerRadius(10)
        .shadow(color: .gray, radius: 5)
    }
}
//
//struct BusquedaView_Previews: PreviewProvider {
//    static var previews: some View {
//        VistaHistorial().environmentObject(ViewModel())
//    }
//}
