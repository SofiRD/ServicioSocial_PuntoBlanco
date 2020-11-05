//
//  dashboardViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit



class dashboardViewController: UIViewController, protocoloModificarPerfil{
    
    var user : Usuario = Usuario(idUsuario: 1, nombre: "Sebastian Diaz", correo: "sebastian@gmail.com", contrasena: "sebastian1234", imagenPerfil: UIImage(named: "foto"))
    
    @IBOutlet weak var lbNombreUsuario: UILabel!
    @IBOutlet weak var imagenPerfilUsuario: UIImageView!
    @IBOutlet weak var lbSaludoNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbNombreUsuario.text = user.nombre
        imagenPerfilUsuario.image = user.imagenPerfil
        lbSaludoNombre.text = user.nombre
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "configurar"{
            let vistaConf = segue.destination as! ConfiguracionViewController
            vistaConf.unUsuario = user
        }
        else if segue.identifier == "notificacion"{
            let vistaNotificacion = segue.destination as! ViewController2
            vistaNotificacion.popoverPresentationController!.delegate = self
            
        }
        
    }
    
    // MARK: - Modificar perfil
    func modificar(us: Usuario) {
        user = us
        viewDidLoad()
    }
    

}
