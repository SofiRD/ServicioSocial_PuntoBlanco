//
//  ViewControllerNotificacion.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user179426 on 11/5/20.
//

import UIKit
import Firebase

class ViewControllerNotificacion: UIViewController , UIPopoverPresentationControllerDelegate{

    var userReference :DatabaseReference!
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("notis:")
        print(userReference)
        preferredContentSize = CGSize(width: 150, height: 200)
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
