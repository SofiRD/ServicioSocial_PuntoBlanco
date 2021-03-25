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

    @IBOutlet weak var lbNombreEvento: UILabel!
    @IBOutlet weak var lbFechaEvento: UILabel!
    @IBOutlet weak var lbDescripcionEvento: UILabel!
    
    @IBOutlet weak var btRegistrar: UIButton!
    @IBOutlet weak var lbRegistro: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("evntos2")
        print(userReference)
        // Do any additional setup after loading the view.
        title = "Detalle de evento"
        lbRegistro.alpha = 0
        lbNombreEvento.text = unEvento.nombreEvento
        lbFechaEvento.text = unEvento.fecha
        lbDescripcionEvento.text = unEvento.descripcion
        
        if(!unEvento.isRegistered){
            lbRegistro.alpha = 0
            btRegistrar.setTitle("Registrarme", for: .normal)
        }else{
            lbRegistro.alpha = 1
            btRegistrar.setTitle("Cancelar registro", for: .normal)
        }

    }
    
    
    @IBAction func registrar(_ sender: UIButton) {
        if(unEvento.isRegistered){
            unEvento.isRegistered = false
            lbRegistro.alpha = 0
            btRegistrar.setTitle("Registrarme", for: .normal)
            //aquí se debe manipular la base de datos
        }else{
            unEvento.isRegistered = true
            lbRegistro.alpha = 1
            btRegistrar.setTitle("Cancelar registro", for: .normal)
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
