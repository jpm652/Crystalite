//
//  Componentes.swift
//  Crystalite
//
//  Created by Aula11 on 25/11/22.
//
import Foundation
import SwiftUI


struct boton: View{
    
    var texto : String;
    var vista : AnyView;
    
    var body:some View{
        
        
        NavigationLink(destination: vista){
            Label(texto, systemImage: "app.badge")
                .frame(width: 245, height: 59)
                .background(Color("Azul"))
                .tint(.black)
                .clipShape(RoundedRectangle (cornerRadius: 19))
                .padding(.all, 15)
                .labelStyle(TitleOnlyLabelStyle())
            
        }
    }
}

struct ElementoView: View{
    
    @EnvironmentObject var vm: ViewModel
    
    var elemento : ElementoEntity
    @State var valor : Double = 0.0
    @State var altura: CGFloat = 60
    @State var mostrarSlider : Bool = false
    @State var valorFinal : String = ""
    @State var valorSlider: Double = 0.0
    
    var body:some View{
        VStack(){
            HStack (){
                Image(elemento.iniciales ?? "")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .clipShape(RoundedRectangle (cornerRadius: 10))
                
                VStack(alignment: .leading) {
                    Text(elemento.iniciales ?? "").font(.title3)
                    Text(elemento.nombre ?? "")
                    
                }.frame(width: 150, alignment: .leading)
                TextField(String(valor), text: $valorFinal, onEditingChanged: {editing  in
                    vm.editElemento(elemento: elemento, valorNuevo: Double(valorFinal) ?? 1)
                })
                    .frame(width: 50)
                
                
                Button{
                    mostrarSlider.toggle()
                    if mostrarSlider{
                        altura=100
                    }else{
                        altura=60
                    }
                }label: {
                    Image(systemName: "plus.circle")
                }

            }
            
            if mostrarSlider {
                VStack{
                    Slider(value: $valorSlider, in: 0.0...20.0,
                           onEditingChanged:{ editing in
                        valorFinal = String(format: "%.2f", valorSlider)
                        vm.editElemento(elemento: elemento, valorNuevo: valorSlider)
                    }
                    ).frame(width: 280)
                }
            }
        }
        .frame(width: 300, height: altura)
        .background(.white)
        .cornerRadius(15)
        .onAppear(){
            valorFinal = String(format: "%.2f", elemento.valor)
            mostrarSlider = false
            altura = 60
        }
        
    }
    
}
func comprobarValorElemento(elemento: ElementoEntity, valor: String){
    @EnvironmentObject var vm: ViewModel

    vm.editElemento(elemento: elemento, valorNuevo: Double(valor) ?? 1)
}

struct estudioHistorial: View{
    var proceso: Bool
    var tipoCristal: String;
    var nombreEnsayo: String;
    var fecha: Date;
    
    var body:some View{
        ZStack{
            Color("Gris").ignoresSafeArea()
            VStack(alignment: .leading){
                HStack{
                    Label("Fecha", systemImage: "circle.inset.filled").tint(.black)
                    HStack (){
                        
                        VStack(alignment: .leading) {
                            Text(tipoCristal).font(.title3).tint(.black)
                            Text("Nombre: \(nombreEnsayo)").font(.caption).tint(.black)
                            if proceso{
                                Text("En proceso").font(.caption).tint(.red)

                            }
                        }.padding(.leading)
                            .frame(width: 170, alignment: .leading)
                        
                        Image(tipoCristal)
                            .resizable()
                            .frame(width: 125, height: 100)
                            .clipShape(RoundedRectangle (cornerRadius: 10))
                        
                    }
                    .frame(width: 280, height: 100)
                    .background(.white)
                    .cornerRadius(15)
                }
            }
            
            
        }
    }
}

struct elementoCristal: View{
    
    var tipo : String;
    var nombre : String;
    var fecha : String;
    
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(tipo).font(.title2);
                Text(nombre).font(.title3);
                Text(fecha);
            }.frame(width: 180, height: 100, alignment: .leading)
            Image("Cristal vidrio botella")
                .resizable()
                .frame(width: 125, height: 100, alignment: .trailing)
                .cornerRadius(15);
        }
        .frame(width: 300, height: 100)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct elementoCristalEdicion: View{
    
    @EnvironmentObject var vm: ViewModel
    var tipoCristal: String;
    @State var nombreEnsayo: String;
    var fecha: String;
    @State var cambiarNombre : Bool = false
    @State var currentNomEnsayo = ""
    @State var ensayo : EnsayoEntity
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                Text(tipoCristal).font(.body)
                Spacer().frame(height: 0.1)
                HStack{
                    
                    Text("Nombre: \(nombreEnsayo)").font(.caption)
                    
                    Button() {
                        cambiarNombre.toggle()
                        if !cambiarNombre {
                            if(currentNomEnsayo.isEmpty){
                                nombreEnsayo = nombreEnsayo
                                vm.editNombreEnsayo(ensayo: ensayo, nombrenuevo: nombreEnsayo)
                            }else {
                                nombreEnsayo = currentNomEnsayo
                                vm.editNombreEnsayo(ensayo: ensayo, nombrenuevo: currentNomEnsayo)

                            }
                        }
                    } label: {
                        Image(systemName: (cambiarNombre ? "pencil.slash":"pencil" ))
                            .resizable()
                            .frame(width: 10, height: 10)
                            .padding()
                            .foregroundColor(.gray)
                    }
                }
                if cambiarNombre {
                    TextField("Nuevo nombre...", text:$currentNomEnsayo)
                        .font(.caption2)
                        .padding(.horizontal,15)
                        .background(Color(red: 0.95, green: 0.95, blue: 0.95))
                        .cornerRadius(5)
                        .frame(width: 150, height: 40, alignment: .leading)
                        .padding(.top,-30)
                }
                
                Spacer().frame(height: 0.1)
                Text(fecha).font(.caption);
            }.frame(width: 180, height: 100, alignment: .leading)
                .padding(.leading, -30)
            Image(tipoCristal)
                .resizable()
                .frame(width: 125, height: 100, alignment: .trailing)
                .cornerRadius(15)
                .padding(.trailing,-50)
        }
        .frame(width: 320, height: 100)
        .background(Color.white)
        .cornerRadius(15)
    }
}

struct elementoResultadoFila: View{
    
    var iniciales : String;
    var nombre : String;
    var value : Double;
    
    var body: some View{
        
        HStack (){
            Image(iniciales)
                .resizable()
                .frame(width: 35, height: 35)
                .clipShape(RoundedRectangle (cornerRadius: 10))
            VStack(alignment: .leading) {
                Text(iniciales).tint(.black)
                Text(nombre).tint(.black)
                
            }.frame(width: 170, alignment: .leading)
            Text(String(format: "%.2f",value)).frame(width: 50).tint(.black)
        }
        .frame(width: 300, height: 60)
        .background(.white)
        .cornerRadius(15)
        
    }
    
}
struct elementoResultadoCuadrado: View{
    
    var iniciales : String;
    var value : Double;
    
    var body: some View{
        VStack (alignment: .center){
            Image(iniciales)
                .resizable()
                .frame(width: 35, height: 35)
                .clipShape(RoundedRectangle (cornerRadius: 10))
            VStack() {
                Text(iniciales).padding(.leading,-30).font(.title2).tint(.black)
                Text(String(format: "%.2f",value)).padding(.trailing,-20).frame(width: 50).tint(.black)

            }.frame(width: 55)
        }
        .frame(width: 85, height: 120)
        .background(.white)
        .cornerRadius(15)
    }
    
}

struct preguntas: View{
    
    var preguntas: String;
    
    var body: some View{
        HStack() {
            Text(preguntas).frame(width: 300, height: 50).background(.white).cornerRadius(10).foregroundColor(.black)
        }
    }
    
}

struct respuestas: View{
    
    var respuestas: String;
    
    var body: some View{
        HStack() {
            Text(respuestas)
        }
    }
    
}

struct ViewDescripcionElemento: View{
    
    @Binding var mostrar: Bool
    @Binding var elemento : ElementoEntity
    
    var body: some View{
        ZStack(alignment: .bottom){
            if(mostrar){
            Color.black
                .opacity(0.3)
                .ignoresSafeArea()
                .onTapGesture {
                    mostrar = false
                }
            VStack{
                Text(elemento.nombre ?? "")
            }.frame(height: 400)
                .frame(maxWidth: .infinity)
                .background(.white)
                .transition(.move(edge: .bottom))
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .ignoresSafeArea()
            .animation(.easeInOut, value: 5)
        
    }

}
