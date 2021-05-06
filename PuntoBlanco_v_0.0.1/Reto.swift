//
//  Reto.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit

class Reto: NSObject {
    var nombreReto : String
    var idReto : Int
    var descripcion : String
    var numeroDia : Int
    var isRegistered : Bool
    
    init(nombreReto: String, idReto: Int, descripcion: String, numeroDia: Int, isRegistered: Bool) {
        self.nombreReto = nombreReto
        self.idReto = idReto
        self.descripcion = descripcion
        self.numeroDia = numeroDia
        self.isRegistered = isRegistered
    }
}
