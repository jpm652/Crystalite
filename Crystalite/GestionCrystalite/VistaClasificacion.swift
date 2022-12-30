//
//  Clasificacion.swift
//  Crystalite
//
//  Created by David Silvente on 26/10/22.
//

import SwiftUI

struct VistaClasificacion: View {
    @EnvironmentObject var vm: ViewModel
    
    @State var valorAl: Double = 0.0;
    @State var valorBa: Double = 0.0;
    @State var valorCa: Double = 0.0;
    @State var valorIr: Double = 0.0;
    @State var valorMg: Double = 0.0;
    @State var valorK: Double = 0.0;
    @State var nombreEnsayo: String = ""
    @State var resultado: String = ""

    //@State var ensayo: EnsayoEntity
    
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
                
                VStack(alignment: .leading) {
                    Text("Introducir ensayo").font(.title).bold()
                    Spacer().frame(height: 15)
                    Text("Nombre: ").font(.title2)
                    
                    TextField("Introducir nombre del ensayo", text: $nombreEnsayo)
                        .padding(.leading,20)
                        .frame(width: 300, height: 34)
                        .background(.white)
                        .cornerRadius(10)
                }
                
                Spacer().frame(height: 20)
                
                ScrollView{
                    ForEach(vm.elementoArray){
                        elementos in
                        ElementoView(elemento: elementos)
                    }
                }
                
                Button(){
                        valorAl = vm.elementoArray[0].valor
                        valorBa = vm.elementoArray[1].valor
                        valorCa = vm.elementoArray[2].valor
                        valorIr = vm.elementoArray[3].valor
                        valorMg = vm.elementoArray[4].valor
                        valorK = vm.elementoArray[5].valor
                    
                        resultado = calcularResultado(al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)


                        if(valorAl == 0.0 || valorBa == 0.0 || valorCa == 0.0 || valorIr == 0.0 || valorK == 0.0 || valorMg == 0.0){
                            vm.addEnsayo(persona: vm.personaArray[0], nombre: nombreEnsayo, fecha: Date(), enProceso: true, resultado: "En proceso", al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        }else{
                            vm.addEnsayo(persona: vm.personaArray[0], nombre: nombreEnsayo, fecha: Date(), enProceso: false, resultado: resultado, al: valorAl, ba: valorBa, ca: valorCa, ir: valorIr, k: valorK, mg: valorMg)
                        }
                    
                }label: {
                    Text("Clasificar cristal")
                        .frame(width: 245, height: 59)
                        .background(Color("Azul"))
                        .tint(.black)
                        .clipShape(RoundedRectangle (cornerRadius: 19))
                        .padding(.all, 15)
                        .labelStyle(TitleOnlyLabelStyle())
                }
                
            }
        }.onAppear(){
            vm.elementoArray[0].valor = 0
            vm.elementoArray[1].valor = 0
            vm.elementoArray[2].valor = 0
            vm.elementoArray[3].valor = 0
            vm.elementoArray[4].valor = 0
            vm.elementoArray[5].valor = 0
        }
        .onDisappear(){
            nombreEnsayo = ""
            vm.elementoArray[0].valor = 0
            vm.elementoArray[1].valor = 0
            vm.elementoArray[2].valor = 0
            vm.elementoArray[3].valor = 0
            vm.elementoArray[4].valor = 0
            vm.elementoArray[5].valor = 0
        }
    }
}


func calcularResultado(al:Double, ba:Double, ca: Double, ir: Double, k: Double, mg:Double) -> String{
    
    if(ba <= 0.27){
        if(mg <= 2.41){
            return LM_1(al: al, ba: ba, ca: ca, ir: ir, k: k, mg: mg)
        }else{
            if(al <= 1.41){
                if(ir <= 1.5170){
                    return LM_2(al: al, ba: ba, ca: ca, ir: ir, k: k, mg: mg)
                }else{
                    if(k <= 0.23){
                        
                    }else{
                        
                    }
                }
            }else{
                if(mg <= 3.45){
                    
                }else{
                    
                }
            }
        }
    }else{
        
    }
    return "hola"
}

func LM_1(al:Double, ba:Double, ca: Double, ir: Double, k: Double, mg:Double) -> String{
    
    var resultados : [Double] = []
    let construccionfloat : Double = -145.54 + (ir * 90.16) + (mg * 1.32) + (al * -4.5) + (k * 0.78) + (ca * 0.06) + (ba * -9.19)
    let construccionNonfloat : Double = -786.27 + (ir * 519.68) + (mg * -0.4) + (al * -1.28) + (k * 0.8) + (ca * -0.11) + (ba * 8.25)
    let vehiculofloat : Double = 460.78 + (ir * -316.05) + (mg * 1.76) + (al * -2.75) + (k * -2.68) + (ca * 0.87)
    let vehiculoNonfloat : Double = -31.08 + (mg * 0.01)
    let contenedores : Double = 871.16 + (ir * -584.24) + (mg * -0.57) + (al * 4.56) + (k * 0.86) + (ca * 1.09) + (ba * 2.46)
    let vajilla : Double = -824.35 + (ir * 553.91) + (mg * -0.21) + (al * 4.65) + (k * -113.95) + (ca * -1.65) + (ba * -3.04)
    let faro : Double = -1444.01 + (ir * 966.12) + (mg * -0.84) + (al * 0.36) + (k * 1.46) + (ca * -2.49) + (ba * -7.47)
    
    resultados.append(construccionfloat)
    resultados.append(construccionNonfloat)
    resultados.append(vehiculofloat)
    resultados.append(vehiculoNonfloat)
    resultados.append(contenedores)
    resultados.append(vajilla)
    resultados.append(faro)
    
    if(resultados.max() == construccionfloat){
        return "Vidrio construccion flotado"
    }else if(resultados.max() == construccionNonfloat){
        return "Vidrio construccion no flotado"
    }else if(resultados.max() == vehiculofloat){
        return "Vidrio vehiculo flotado"
    }else if(resultados.max() == vehiculoNonfloat){
        return "Vidrio vehiculo no flotado"
    }else if(resultados.max() == contenedores){
        return "Vidrio contenedor"
    }else if(resultados.max() == vajilla){
        return "Vidrio vajilla"
    }else{
        return "Vidrio faro"
    }

}

func LM_2(al:Double, ba:Double, ca: Double, ir: Double, k: Double, mg:Double) -> String{
    
    var resultados : [Double] = []
    let construccionfloat : Double = 87436.25 + (ir * -57673.49) + (mg * -0.3) + (al * -3.22) + (k * 8.39) + (ca * -0.27) + (ba * -11.98)
    let construccionNonfloat : Double = -14792.07 + (ir * 9815.19) + (mg * 0.83) + (al * -67.56) + (k * -10.17) + (ca * -0.32) + (ba * -7.98)
    let vehiculofloat : Double = 6100.72 + (ir * -4073.23) + (mg * 1.52) + (al * 10.93) + (k * -3.71) + (ca * 7.25) + (ba * 1.81)
    let vehiculoNonfloat : Double = -51.65 + (mg * 0.01)
    let contenedores : Double = 17.53 + (ir * -38.05) + (mg * -1.25) + (al * 3.98) + (k * 0.49) + (ca * 0.46) + (ba * 2.46)
    let vajilla : Double = 154.89 + (ir * -118.9) + (mg * -0.21) + (al * 3.9) + (k * -112.96) + (ca * -0.54) + (ba * -3.04)
    let faro : Double = -3733.18 + (ir * 2457.43) + (mg * -6) + (al * 0.36) + (k * 29.99) + (ca * -1.31) + (ba * 1.62)
    
    resultados.append(construccionfloat)
    resultados.append(construccionNonfloat)
    resultados.append(vehiculofloat)
    resultados.append(vehiculoNonfloat)
    resultados.append(contenedores)
    resultados.append(vajilla)
    resultados.append(faro)
    
    if(resultados.max() == construccionfloat){
        return "Vidrio construccion flotado"
    }else if(resultados.max() == construccionNonfloat){
        return "Vidrio construccion no flotado"
    }else if(resultados.max() == vehiculofloat){
        return "Vidrio vehiculo flotado"
    }else if(resultados.max() == vehiculoNonfloat){
        return "Vidrio vehiculo no flotado"
    }else if(resultados.max() == contenedores){
        return "Vidrio contenedor"
    }else if(resultados.max() == vajilla){
        return "Vidrio vajilla"
    }else{
        return "Vidrio faro"
    }

}

func LM_3(al:Double, ba:Double, ca: Double, ir: Double, k: Double, mg:Double) -> String{
    
    var resultados : [Double] = []
    let construccionfloat : Double = 124.97 + (ir * -78.58) + (mg * 1.28) + (al * -3.05) + (k * -4.5) + (ca * -0.28) + (ba * -23.86)
    let construccionNonfloat : Double = -815.23 + (ir * 619.01) + (mg * -36.66) + (al * -3.17) + (k * 7.46) + (ca * -0.02) + (ba * -7.98)
    let vehiculofloat : Double = 1151 + (ir * -753.53) + (mg * 1.77) + (al * -4.44) + (k * -3.4) + (ca * -0.46) + (ba * 19.21)
    let vehiculoNonfloat : Double = -61.93 + (mg * 0.01)
    let contenedores : Double = 7.24 + (ir * -38.05) + (mg * -1.25) + (al * 3.98) + (k * 0.49) + (ca * 0.46) + (ba * 2.46)
    let vajilla : Double = 144.61 + (ir * -118.9) + (mg * -0.21) + (al * 3.9) + (k * -112.96) + (ca * -0.54) + (ba * -3.04)
    let faro : Double = -5209.15 + (ir * 3431.78) + (mg * -10.39) + (al * 0.36) + (k * 45.07) + (ca * -1.31) + (ba * 1.62)
    
    resultados.append(construccionfloat)
    resultados.append(construccionNonfloat)
    resultados.append(vehiculofloat)
    resultados.append(vehiculoNonfloat)
    resultados.append(contenedores)
    resultados.append(vajilla)
    resultados.append(faro)
    
    if(resultados.max() == construccionfloat){
        return "Vidrio construccion flotado"
    }else if(resultados.max() == construccionNonfloat){
        return "Vidrio construccion no flotado"
    }else if(resultados.max() == vehiculofloat){
        return "Vidrio vehiculo flotado"
    }else if(resultados.max() == vehiculoNonfloat){
        return "Vidrio vehiculo no flotado"
    }else if(resultados.max() == contenedores){
        return "Vidrio contenedor"
    }else if(resultados.max() == vajilla){
        return "Vidrio vajilla"
    }else{
        return "Vidrio faro"
    }

}


//struct VistaClasificacion_Previews: PreviewProvider {
//    static var previews: some View {
//        
//        VistaClasificacion().environmentObject()
//    }
//}
