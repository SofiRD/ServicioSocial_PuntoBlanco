//
//  EventoViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 5/12/21.
//

import UIKit
import Firebase

class EventoViewController: UIViewController {

    var unEvento : Evento!
     var userReference :DatabaseReference!

    @IBOutlet weak var eventPlaceholder: UIView!
    @IBOutlet weak var lbNombreEvento: UILabel!
    @IBOutlet weak var lbFechaEvento: UILabel!
    @IBOutlet weak var lbDescripcionEvento: UILabel!
    
    @IBOutlet weak var imagenEvento: UIImageView!
    @IBOutlet weak var btRegistrar: UIButton!
    //@IBOutlet weak var lbRegistro: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("evntos2")
        btRegistrar.isEnabled = false
        btRegistrar.isHidden = true
        
        switch UIDevice.current.orientation {
        case .portrait:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.height * 0.03)
        case .landscapeLeft:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.width * 0.046)
        case .landscapeRight:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.width * 0.046)
        default:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.height * 0.03)
        }

        
        print(userReference)
        // Do any additional setup after loading the view.
        title = "Detalle de evento"
        //lbRegistro.alpha = 0
        lbNombreEvento.text = unEvento.nombreEvento
        lbFechaEvento.text = unEvento.fecha
        lbDescripcionEvento.text = unEvento.descripcion
        imagenEvento.image = unEvento.imagen

        
        eventPlaceholder.layer.cornerRadius = eventPlaceholder.frame.size.width / 18
        eventPlaceholder.clipsToBounds = true
        
        imagenEvento.layer.cornerRadius = imagenEvento.frame.size.width / 18
        imagenEvento.alpha = 0.5
        imagenEvento.clipsToBounds = true

    }
    
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        switch UIDevice.current.orientation {
        case .portrait:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.height * 0.03)
        case .landscapeLeft:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.width * 0.046)
        case .landscapeRight:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.width * 0.046)
        default:
            lbNombreEvento.font = lbNombreEvento.font.withSize(self.view.frame.height * 0.03)
        }
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
