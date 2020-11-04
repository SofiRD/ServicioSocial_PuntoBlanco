//
//  Usuario.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit

class Usuario: NSObject {
    var idUsuario : Int
    var nombre : String
    var correo : String
    var contrasena : String
    var imagenPerfil : UIImage!
    
    init(idUsuario: Int, nombre: String, correo: String, contrasena: String, imagenPerfil: UIImage!) {
        self.idUsuario = idUsuario
        self.nombre = nombre
        self.correo = correo
        self.contrasena = contrasena
        self.imagenPerfil = imagenPerfil
    }
    
}
