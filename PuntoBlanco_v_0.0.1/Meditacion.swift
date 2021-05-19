//
//  Meditacion.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit

class Meditacion: NSObject {
    var nombreMeditacion : String
    var tipoMeditacion : String
    var ritmoCardIni : Int
    var ritmoCardFin : Int
    var nota : String!
    var estadoAnimo : String!
    var fecha : String!
    
    //cuando se tiene nota (unico valor opcional)
    init(nombreMeditacion: String, tipoMeditacion: String, ritmoCardIni: Int, ritmoCardFin: Int, nota: String, estadoAnimo: String, fecha: String) {
        self.nombreMeditacion = nombreMeditacion
        self.tipoMeditacion = tipoMeditacion
        self.ritmoCardIni = ritmoCardIni
        self.ritmoCardFin = ritmoCardFin
        self.nota = nota
        self.estadoAnimo = estadoAnimo
        self.fecha = fecha
    }
    
    //inicializacion sin nota
    init(nombreMeditacion: String, tipoMeditacion: String, ritmoCardIni: Int, ritmoCardFin: Int, estadoAnimo: String, fecha: String) {
        self.nombreMeditacion = nombreMeditacion
        self.tipoMeditacion = tipoMeditacion
        self.ritmoCardIni = ritmoCardIni
        self.ritmoCardFin = ritmoCardFin
        self.estadoAnimo = estadoAnimo
        self.fecha = fecha
    }
}
