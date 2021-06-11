//
//  Ritmo.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Victor on 10/06/21.
//

import UIKit

class Ritmo: NSObject {
    var ritmo: Double
    var fecha : String
    var categoria : Int
    var sortingDate: Date
    
    init(ritmo: Double, fecha: String, categoria: Int, sortingDate: Date) {
        self.ritmo = ritmo
        self.fecha = fecha
        self.categoria = categoria
        self.sortingDate = sortingDate
    }
}
