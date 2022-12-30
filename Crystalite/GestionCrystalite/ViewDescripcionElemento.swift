//
//  ViewDescripcionElemento.swift
//  Crystalite
//
//  Created by Aula11 on 30/12/22.
//

import SwiftUI

struct ViewDescripcionElemento: View {
    @Binding var mostrar: Bool
    @Binding var elemento : ElementoEntity
    @State private var isDragging = false
    @State private var curHeight:CGFloat = 400
    let minHeight: CGFloat = 400
    let maxHeight: CGFloat = 700
    
    var body: some View{
        
        ZStack(alignment: .bottom){
            
            if(mostrar){
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        mostrar = false
                    }
                
                elemtView.transition(.move(edge: .bottom))
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
        .animation(.easeInOut, value: 5)
        
    }
    
    // @State var width = UIScreen.main.bounds.width
    
    var elemtView: some View{
        
        VStack{
            
            ZStack{
                Capsule()
                    .frame(width: 40, height: 6)
            }
            .frame(height: 40)
            .frame(maxWidth: .infinity)
            .background(Color.white.opacity(0.0001))
            .gesture(dragGesture)
            
            ZStack{
                ZStack(alignment: .top){
                    VStack{
                        Text(elemento.nombre ?? "")
                    }
                    
                    //zIndex(1)
                    // Circle()
                        // .fill(Color("Azul"))
                        //.frame(width: self.width + 200, height: self.width+200)
                        // .padding(.horizontal, -100)
                        //.offset(y: -self.width)
                    
                }
                .padding(.horizontal, 30)
            }
            .frame(maxHeight: .infinity)
            .padding(.bottom, 35)
        }
        .frame(height: curHeight)
        .frame(maxWidth: .infinity)
        .background(
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                Rectangle()
                    .frame(height: curHeight/2)
            }.foregroundColor(.white)
        )
        .animation(isDragging ? nil : .easeInOut(duration: 0.45), value: 5)
    }
    
    @State private var prevDragTransalation = CGSize.zero
    
    var dragGesture : some Gesture{
        DragGesture(minimumDistance: 0, coordinateSpace: .global)
            .onChanged{ val in
                
                if !isDragging{
                    isDragging = true
                }
                
                let dragAmount = val.translation.height - prevDragTransalation.height
                if curHeight > maxHeight || curHeight < minHeight{
                    curHeight -= dragAmount / 6
                }else{
                    curHeight -= dragAmount
                }
            }
            .onEnded{ val in
                prevDragTransalation = .zero
                isDragging = false
                if curHeight > maxHeight{
                    curHeight = maxHeight
                }else if curHeight < minHeight{
                    curHeight = minHeight
                }
            }
    }
}
/*
struct ViewDescripcionElemento_Previews: PreviewProvider {
    static var previews: some View {
        ViewDescripcionElemento()
    }
}
 */
