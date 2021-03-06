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
    @IBOutlet weak var containerView: UIView!
    @IBOutlet var mainView: UIView!
    
    var color = UIColor(red: 244/255, green: 91/255, blue: 105/255, alpha: 0.7)
    
    var orientations = UIInterfaceOrientationMask.portrait //or what orientation you want
        override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        get { return self.orientations }
        set { self.orientations = newValue }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(unaMeditacion.nombreMeditacion)
        containerView.backgroundColor = color
        mainView.backgroundColor = UIColor(white: 1, alpha: 0.5)
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
