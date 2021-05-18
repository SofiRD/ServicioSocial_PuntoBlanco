//
//  historialViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 4/18/21.
//

import UIKit


class historialViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    
    @IBOutlet weak var botonMeditaciones: UIButton!
    @IBOutlet weak var botonEventos: UIButton!
    @IBOutlet weak var botonNotas: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        botonMeditaciones.layer.borderWidth = 1
        botonMeditaciones.layer.cornerRadius = 10
        
        botonEventos.layer.borderWidth = 1
        botonEventos.layer.cornerRadius = 10
        
        botonNotas.layer.borderWidth = 1
        botonNotas.layer.cornerRadius = 10
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationController?.navigationBar.layer.cornerRadius = 20
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.258241415, green: 0.7050990462, blue: 0.6889674664, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return.none
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "popOverMeditaciones"{
            let vistaPopOver = segue.destination as! historialMeditacionesTableViewController
            vistaPopOver.popoverPresentationController?.delegate = self
        }else if segue.identifier == "popOverEventos"{
            let vistaPopOver = segue.destination as! historialEventosTableViewController
            vistaPopOver.popoverPresentationController?.delegate = self
        }else if segue.identifier == "popOverNotas"{
            let vistaPopOver = segue.destination as! historialNotasTableViewController
            vistaPopOver.popoverPresentationController?.delegate = self
        }
    }

}
