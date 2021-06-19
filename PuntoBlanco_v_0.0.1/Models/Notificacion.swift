//
//  Notificacion.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 6/7/21.
//

import UIKit

class Notificacion: NSObject {
    var fecha : String
    var title : String
    var desc : String
    var sortDate : Date
    
    init(fecha : String, title : String, desc : String, sortDate:Date) {
        self.fecha = fecha
        self.title = title
        self.desc = desc
        self.sortDate = sortDate
    }
}
