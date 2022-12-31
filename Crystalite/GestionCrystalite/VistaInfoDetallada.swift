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
    @State var ensayo : EnsayoEntity
    @State private var showmodal = false
    @State var elemento : ElementoEntity = ElementoEntity()
    @State var count : Int = 0
    var body: some View {
        
        ZStack(alignment: .top){
            Color("Gris").ignoresSafeArea()
            
            VStack{
                Text("Informacion detallada").font(.title);
                
                Spacer().frame(height: 30)
                elementoCristalEdicion(tipoCristal: ensayo.resultCristal ?? "Ensayo",nombreEnsayo: ensayo.nombre ?? "Nombre", fecha: ponerFecha(fecha: ensayo.fecha ?? Date()), ensayo: ensayo)
                
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
                                showmodal.toggle()
                                elemento = ele
                            }label: {
                                elementoResultadoFila(iniciales: ele.iniciales ?? "", nombre: ele.nombre ?? "",value: ObtenerValor(elemento: ele, ensayo: ensayo) )
                            }.sheet(isPresented: $showmodal, content: {
                                ViewDescripcionElemento(elemento: $elemento)
                            })
                        }

                    }
                }else{
                    HStack{
                    ForEach(vm.elementoArray){ ele in
                        
                        if(vm.elementoArray.firstIndex(of: ele) ?? 3 < 3){
                            Button(){
                                showmodal.toggle()
                                elemento = ele
                            }label: {
                                elementoResultadoCuadrado(iniciales: ele.iniciales ?? "",value: ObtenerValor(elemento: ele, ensayo: ensayo))
                            }.sheet(isPresented: $showmodal, content: {
                                ViewDescripcionElemento(elemento: $elemento)
                            })
                            if(vm.elementoArray.firstIndex(of: ele) ?? 3 < 2){
                                Spacer().frame(width: 20)
                            }
                            
                        }
                        
                    }
                    }
                    
                    HStack{
                    ForEach(vm.elementoArray){ ele in
                        
                        if(vm.elementoArray.firstIndex(of: ele) ?? 3 >= 3){
                            Button(){
                                showmodal.toggle()
                                elemento = ele
                            }label: {
                                elementoResultadoCuadrado(iniciales: ele.iniciales ?? "",value: ObtenerValor(elemento: ele, ensayo: ensayo))
                            }.sheet(isPresented: $showmodal, content: {
                                ViewDescripcionElemento(elemento: $elemento)
                            })
                            if(vm.elementoArray.firstIndex(of: ele) ?? 3 < 5){
                                Spacer().frame(width: 20)
                            }
                        }
                        
                    }
                    }
                        }
                        
                    
                    /*HStack{
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
                    }*/
                
            }.padding(.top,-50)
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
/*
func cambioDisposicion(){
    @EnvironmentObject var vm: ViewModel
    @State var count : Int = 0
    @State var showmodal = false
    @State var elemento : ElementoEntity = ElementoEntity()
    @State var ensayo : EnsayoEntity

    ForEach(vm.elementoArray){ ele in
        HStack{
            if(count < 3){
                Button(){
                    showmodal.toggle()
                    elemento = ele
                }label: {
                    elementoResultadoCuadrado(iniciales: ele.iniciales ?? "",value: ObtenerValor(elemento: ele, ensayo: ensayo))
                }.sheet(isPresented: $showmodal, content: {
                    ViewDescripcionElemento(elemento: $elemento)
                })
                count+=1
            }
            
        }
        
    }
}
*/
func ponerFecha(fecha : Date) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/YY"
    return dateFormatter.string(from: fecha)
}

func ponerFechaPeq(fecha : Date) -> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM"
    return dateFormatter.string(from: fecha)
}
