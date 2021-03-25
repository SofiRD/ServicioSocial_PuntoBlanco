//
//  Evento.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit

class Evento: NSObject {
    var nombreEvento: String
    var idEvento: Int
    var fecha : String
    var descripcion : String
    var isRegistered : Bool
    
    init(nombreEvento: String, idEvento: Int, fecha: String, descripcion: String, isRegistered: Bool) {
        self.nombreEvento = nombreEvento
        self.idEvento = idEvento
        self.fecha = fecha
        self.descripcion = descripcion
        self.isRegistered = isRegistered
    }
}
