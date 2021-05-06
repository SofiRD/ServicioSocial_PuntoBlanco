//
//  dashboardViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 10/18/20.
//

import UIKit
import FirebaseFirestore
import Firebase

class dashboardViewController: UIViewController, protocoloModificarPerfil, UIPopoverPresentationControllerDelegate{
    
    var userReference : DatabaseReference!
    var db :DatabaseReference!
    var user : Usuario = Usuario(idUsuario: 1, nombre: "Sebastian Diaz", correo: "sebastian@gmail.com", contrasena: "sebastian1234", imagenPerfil: UIImage(named: "foto"))
    
    @IBOutlet weak var logOut: UIButton!
    @IBOutlet weak var lbNombreUsuario: UILabel!
    @IBOutlet weak var imagenPerfilUsuario: UIImageView!
    @IBOutlet weak var lbSaludoNombre: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)

        // Do any additional setup after loading the view.
        lbNombreUsuario.text = user.nombre
        imagenPerfilUsuario.image = user.imagenPerfil
        lbSaludoNombre.text = user.nombre
    }
    
    
    @IBAction func logOut(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "configurar"{
            let vistaConf = segue.destination as! ConfiguracionViewController
            vistaConf.unUsuario = user
            vistaConf.userReference = userReference
        }
        else if segue.identifier == "notificacion"{
            let vistaNotificacion = segue.destination as! ViewController2
            vistaNotificacion.popoverPresentationController!.delegate = self
            vistaNotificacion.userReference = userReference
            
        } else if segue.identifier == "meditar"{
            let vis = segue.destination as! UINavigationController
            let vista = vis.topViewController as! ViewController2
            print(userReference)
            vista.userReference = userReference
        }  else if segue.identifier == "segEventos"{
            let vis = segue.destination as! UINavigationController
            let vista = vis.topViewController as! TableViewControllerEventos
            print(userReference)
            vista.userReference = userReference
        }  else if segue.identifier == "segRetos"{
            let vis = segue.destination as! UINavigationController
            let vista = vis.topViewController as! TableViewControllerRetos
            print(userReference)
            vista.userReference = userReference
        } else if segue.identifier == "estadisticas"{
            let vistaNotificacion = segue.destination as! Estadisticas
            vistaNotificacion.userReference = userReference
            vistaNotificacion.db = db
        }
        
    }
    
    // MARK: - Modificar perfil
    func modificar(us: Usuario) {
        user = us
        viewDidLoad()
    }
    

}
