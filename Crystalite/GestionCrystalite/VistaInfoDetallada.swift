//
//  VistaInfoDetallada.swift
//  Crystalite
//
//  Created by David Silvente on 26/11/22.
//

import SwiftUI

struct VistaInfoDetallada: View {
    @EnvironmentObject var vm: ViewModel
    @State var disposicion : Bool = false
    @State var cambiarNomEnsayo : Bool = false
    @State var currentNomEnsayo : String = ""
    //@State var idEnsayo : Int
    @State var ensayo : EnsayoEntity
    @State private var showmodal = false
    @State var elemento : ElementoEntity = ElementoEntity()

    
    
    var body: some View {
        
        

        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Informacion detallada").font(.title);
                
                Spacer().frame(height: 30)
                elementoCristalEdicion(tipoCristal: ensayo.resultCristal ?? "Ensayo",nombreEnsayo: ensayo.nombre ?? "nombre", fecha: "11/02/23", ensayo: ensayo)
                
                Spacer().frame(height: 50)
                HStack{
                    Text("Variables usadas (6)");
                    Spacer().frame(width: 110);
                    
                    Button(){
                        disposicion.toggle()
                    }label: {
                        Image(systemName: disposicion ? "list.dash" : "square.grid.3x3.topleft.filled")
                            .foregroundColor(.black)
                    }
                    
                }.frame(width: 300, alignment: .leading)
            
                if disposicion == false{
                    ScrollView{
                        
                        ForEach(vm.elementoArray){ ele in
                            
                            Button(){
                                showmodal = true
                                elemento = ele
                                
                            }label: {
                                elementoResultadoFila(iniciales: ele.iniciales ?? "", nombre: ele.nombre ?? "",value: ObtenerValor(elemento: ele, ensayo: ensayo) )
                            }
                        }

                    }
                }else{
                    HStack{
                        elementoResultadoCuadrado(iniciales: "Al", value: ensayo.al)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ba", value: ensayo.ba)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Ca",  value: ensayo.ca)
                    }
                    Spacer().frame(height: 30)

                    HStack{
                        elementoResultadoCuadrado(iniciales: "RI", value: ensayo.ir)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "K", value: ensayo.k)
                        Spacer().frame(width: 20)
                        elementoResultadoCuadrado(iniciales: "Mg",value: ensayo.mg)
                    }
                }
            }.padding(.top,-50)
            ViewDescripcionElemento(mostrar: $showmodal, elemento: $elemento)
        }
    }
}
func ObtenerValor(elemento: ElementoEntity, ensayo : EnsayoEntity) -> Double{

    if(elemento.iniciales == "Al") {return ensayo.al}
    else if(elemento.iniciales == "Ba"){return ensayo.ba}
    else if(elemento.iniciales == "Ca"){return ensayo.ca}
    else if(elemento.iniciales == "RI"){return ensayo.ir}
    else if(elemento.iniciales == "Mg"){return ensayo.mg}
    else{return ensayo.k}
    
    
}
