//
//  MeditacionViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 5/12/21.
//

import UIKit

class MeditacionViewController: UIViewController {

    var unaMeditacion: Meditacion!
    @IBOutlet weak var nombreMeditacion: UILabel!
    @IBOutlet weak var tipoMeditacion: UILabel!
    @IBOutlet weak var ritmoCardiacoInicial: UILabel!
    @IBOutlet weak var ritmoCardiacoFinal: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(unaMeditacion.nombreMeditacion)
        
        nombreMeditacion.text = unaMeditacion.nombreMeditacion
        tipoMeditacion.text = unaMeditacion.tipoMeditacion
        ritmoCardiacoInicial.text = String( unaMeditacion.ritmoCardIni) + " PPM"
        ritmoCardiacoFinal.text = String(unaMeditacion.ritmoCardFin) + " PPM"
        
        // Do any additional setup after loading the view.
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
