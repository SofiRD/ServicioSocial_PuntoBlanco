//
//  ViewControllerEventosInfo.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 11/20/20.
//

import UIKit
import Firebase

class ViewControllerEventosInfo: UIViewController {
    
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

        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        print(userReference)
        // Do any additional setup after loading the view.
        title = "Detalle de evento"
        //lbRegistro.alpha = 0
        lbNombreEvento.text = unEvento.nombreEvento
        lbFechaEvento.text = unEvento.fecha
        lbDescripcionEvento.text = unEvento.descripcion
        imagenEvento.image = unEvento.imagen
        
        if(!unEvento.isRegistered){
            //lbRegistro.alpha = 0
            btRegistrar.setTitle("Registrarme", for: .normal)
        }else{
            //lbRegistro.alpha = 1
            btRegistrar.setTitle("Cancelar registro", for: .normal)
            btRegistrar.backgroundColor      = UIColor.red
        }
        
        eventPlaceholder.layer.cornerRadius = eventPlaceholder.frame.size.width / 15
        eventPlaceholder.clipsToBounds = true
        
        imagenEvento.layer.cornerRadius = imagenEvento.frame.size.width / 15
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
    
    @IBAction func registrar(_ sender: UIButton) {
        if(unEvento.isRegistered){
            unEvento.isRegistered = false
            //lbRegistro.alpha = 0
            btRegistrar.setTitle("Registrarme", for: .normal)
            btRegistrar.backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
            //aquí se debe manipular la base de datos
        }else{
            unEvento.isRegistered = true
            //lbRegistro.alpha = 1
            btRegistrar.setTitle("Cancelar registro", for: .normal)
            btRegistrar.backgroundColor = .red
            //aquí se debe manipular la base de datos
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
