//
//  ViewControllerRegistro.swift
//  Charts
//
//  Created by Sofia Dorst on 19.11.20.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class ViewControllerRegistro: UIViewController {

    @IBOutlet weak var tfNom: UITextField!
    @IBOutlet weak var tfApell: UITextField!
    @IBOutlet weak var tfCorr: UITextField!
    @IBOutlet weak var tfContra: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func registrar(_ sender: UIButton) {
        var ref: DatabaseReference!
        ref = Database.database().reference(fromURL: "https://punto-b84a8.firebaseio.com/")
        ref.updateChildValues(["Nombre": tfNom.text!])
        ref.updateChildValues(["Apellido" : tfApell.text!])
        //ref.updateChildValues(["Correo" : tfCorr.text!])
        //ref.updateChildValues(["Contraseña" : tfContra.text!])
        
        guard let email = tfCorr.text, let password = tfContra.text else{
            print("Correo invalido")
            return
        }
        print(email)
        print(password)
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if error != nil{
                print("error")
                return
            }
            else {
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["PrimNom" : self.tfNom.text!, "Apellido" : self.tfApell.text!, "uid" : result!.user.uid])
               
                }
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
