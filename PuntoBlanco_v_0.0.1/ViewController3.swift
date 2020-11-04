//
//  ViewController3.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 04.11.20.
//

import UIKit


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
        let vistaDetalle = segue.destination as! ViewControllerAudio
        vistaDetalle.NombreMedi = nombre
    }

}
