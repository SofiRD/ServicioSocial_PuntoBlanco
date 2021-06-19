//
//  NotaViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 5/2/21.
//

import UIKit


class NotaViewController: UIViewController,UISplitViewControllerDelegate {

    @IBOutlet weak var notaMeditacion: UILabel!
    var unaMeditacion : Meditacion!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        notaMeditacion.text = unaMeditacion.nota
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
