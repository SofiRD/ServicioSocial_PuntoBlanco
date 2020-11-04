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
    var fecha : Date
    var descripcion : String
    
    init(nombreEvento: String, idEvento: Int, fecha: Date, descripcion: String) {
        self.nombreEvento = nombreEvento
        self.idEvento = idEvento
        self.fecha = fecha
        self.descripcion = descripcion
    }
}
