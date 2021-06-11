//
//  Evento.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Victor on 06/10/21.
//

import UIKit

class MeditacionesSemana: NSObject {
    var meditaciones: Int
    var fecha : String
    var categoria : Int
    var sortingDate: Date
    
    init(meditaciones: Int, fecha: String, categoria: Int, sortingDate: Date) {
        self.meditaciones = meditaciones
        self.fecha = fecha
        self.categoria = categoria
        self.sortingDate = sortingDate
    }
}
