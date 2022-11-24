//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct Clasificacion: View {
    var body: some View {
        ZStack{ Color(red: 0.898, green: 0.918, blue: 0.961).ignoresSafeArea()
            VStack (){
                HStack {
                    Spacer().frame(height: 1)
                    
                    Button(action: { }) {
                        Image(systemName: "gear")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50)
                    }
                }

                VStack(alignment: .leading, spacing: 5) {
                    Text("Introducir ensayo")
                    Text("Ensayo")
                    TextField("Introducir nombre del ensayo", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 272, height: 34).background(.white).cornerRadius(15)
                }
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                HStack (){
                    Image(systemName: "gear")
                    VStack {
                        Text("Mg")
                        Text("Magnesio")
                    }.frame(width: 170)
                    TextField("0,0", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/).frame(width: 30)
                    Image(systemName: "plus")
                }.frame(width: 300, height: 60).background(.white)
                
                Button() {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                } label: {
                    Text("Clasificar cristal")
                        .frame(width: 245, height: 59).background(Color(red: 160/255, green: 210/255, blue: 235/255)).tint(.black).clipShape(RoundedRectangle (cornerRadius: 19)).padding(.all, 15)
                }
                
                Spacer()
            }
            
            
            
            
        }
    }
}

struct Clasificacion_Previews: PreviewProvider {
    static var previews: some View {
        Clasificacion()
    }
}
