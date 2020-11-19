//
//  ViewController3.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 04.11.20.
//

import UIKit
import Firebase

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var tfRitmo: UITextField!
    var nombre :String!
    
    override func viewDidLoad() {
        super.viewDidLoad() 
        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       var ref: DatabaseReference!
        ref = Database.database().reference(fromURL: "https://punto-b84a8.firebaseio.com/")
        if (tfRitmo.text==""){
            tfRitmo.text = "0"
        }
        ref.updateChildValues(["RitmoInicial": Int(tfRitmo.text!)!])
        
        let vistaDetalle = segue.destination as! ViewControllerAudio
        vistaDetalle.NombreMedi = nombre
        navigationController?.popViewController(animated: false)
    }

}
