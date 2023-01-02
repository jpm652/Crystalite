//
//  BusquedaView.swift
//  Crystalite
//
//  Created by Aula11 on 28/11/22.
//

import SwiftUI

struct BusquedaView: View {
    @Binding var text : String
    @EnvironmentObject var vm : ViewModel

    var body: some View {
        ZStack{
            Rectangle()
                .fill(vm.modoOscuro ? Color("Busqueda_Oscuro"): .white)
            HStack{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(text.isEmpty ? (vm.modoOscuro ? .white.opacity(0.5) : Color(.gray).opacity(0.5)) :  (vm.modoOscuro ? .white.opacity(1) : Color(UIColor.gray).opacity(1)))
                TextField("Buscar ensayo ...", text:  $text)
                    .tint(.red)
                    .foregroundColor(vm.modoOscuro ? .white :.gray)
                    .disableAutocorrection(true)
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
