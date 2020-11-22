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
    var userReference :DatabaseReference!
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
        
        Auth.auth().signIn(withEmail: email, password: password){(result: AuthDataResult?, error) in
            if error != nil {
                print("error")
                return
            }
            
            let uid = result?.user.uid
            
          let ref = Database.database().reference(fromURL: "https://punto-b84a8.firebaseio.com/")
        self.userReference = ref.child("users").child(uid!)
            self.performSegue(withIdentifier: "login", sender: nil)
        
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "login"{
        print(self.userReference)
        let vista = segue.destination as! dashboardViewController
        vista.userReference = self.userReference
        }
    }
}

