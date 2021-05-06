//
//  ConfiguracionViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit
import Firebase

protocol protocoloModificarPerfil{
    func modificar(us: Usuario)
}

class ConfiguracionViewController: UIViewController {
    
     var userReference :DatabaseReference!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var tfCorreo: UITextField!
    @IBOutlet weak var imagenPerfil: UIImageView!
    var unUsuario : Usuario!
    var delegado : protocoloModificarPerfil!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("configuracion:")
        print(userReference)
        // Do any additional setup after loading the view.
        tfNombre?.text = unUsuario?.nombre
        tfCorreo?.text = unUsuario?.correo

        imagenPerfil?.image = unUsuario?.imagenPerfil!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func viewDidDisappear(_ animated: Bool) {
        let usuario = Usuario(idUsuario: unUsuario.idUsuario, nombre: tfNombre.text!, correo: tfCorreo.text!, contrasena: unUsuario.contrasena, imagenPerfil: imagenPerfil.image)
        delegado?.modificar(us: usuario)
    }
}
