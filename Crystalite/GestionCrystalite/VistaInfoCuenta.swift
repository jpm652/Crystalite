//
//  VistaInfoCuenta.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//

import SwiftUI

struct VistaInfoCuenta: View {
    @EnvironmentObject var vm: ViewModel
    
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
                
                VStack {
                    Button(action: { }) {
                        Image(systemName: "person.crop.circle")
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                            .padding(.horizontal,20)
                    }
                    
                }
                
                Spacer().frame(height: 25)
                VStack{
                    
                }
            }.padding(.top, -80)
        }
    }
}

struct VistaInfoCuenta_Previews: PreviewProvider {
    static var previews: some View {

             VistaInfoCuenta()
     }
 }
