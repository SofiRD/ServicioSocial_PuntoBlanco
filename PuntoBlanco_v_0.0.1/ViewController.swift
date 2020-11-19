//
//  ViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user179426 on 10/18/20.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var tfCorr: UITextField!
    @IBOutlet weak var tfContra: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }


    @IBAction func login(_ sender: Any) {
        guard let email = tfCorr.text, let password = tfContra.text else{
            print("Correo invalido")
            return
        }
        print(email)
        print(password)
        Auth.auth().signIn(withEmail: email, password: password){ (result, error) in
            if error != nil {
                print("error")
            }
        
        }
    }
}

