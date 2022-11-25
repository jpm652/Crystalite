//
//  HistorialView.swift
//  Crystalite
//
//  Created by Aula11 on 18/11/22.
//

import SwiftUI

struct VistaHistorial: View {
    var body: some View {
        
        estudioHistorial(tipoCristal: "Cristal ventana vehiculo", numeroEnsayo: 1, fecha: Date());
    }
}

struct VistaHistorial_Previews: PreviewProvider {
    static var previews: some View {
        VistaHistorial()
    }
}
