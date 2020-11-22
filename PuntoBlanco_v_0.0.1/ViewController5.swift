//
//  ViewController5.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 18.11.20.
//

import UIKit
import Firebase

class ViewController5: UIViewController{
    
    var userReference :DatabaseReference!
    var estado = 0
    var texto :String!
    
    @IBOutlet weak var notas: UITextView!
    @IBOutlet weak var feliz: UIButton!
    @IBOutlet weak var medio: UIButton!
    @IBOutlet weak var meh: UIButton!
    @IBOutlet weak var nobien: UIButton!
    @IBOutlet weak var mal: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func resetFaces(){
        feliz.layer.opacity = 1
        medio.layer.opacity = 1
        meh.layer.opacity = 1
        nobien.layer.opacity = 1
        mal.layer.opacity = 1
    }
    
    
    @IBAction func feliz(_ sender: UIButton) {
        estado = 5
        resetFaces()
        feliz.layer.opacity = 0.5
        //feliz.layer.borderColor = CGColor.init(srgbRed: 200, green: 30, blue: 30, alpha: 0)
        
    }
    @IBAction func medio(_ sender: UIButton) {
        estado = 4
        resetFaces()
        medio.layer.opacity = 0.5
        
        //medio.layer.borderColor = CGColor.init(srgbRed: 200, green: 30, blue: 30, alpha: 0)
    }
    
    @IBAction func meh(_ sender: UIButton) {
        estado = 3
       resetFaces()
        meh.layer.opacity = 0.5
        //meh.layer.borderColor = CGColor.init(srgbRed: 200, green: 30, blue: 30, alpha: 0)
        
    }
    
    @IBAction func nobien(_ sender: Any) {
        estado = 2
        resetFaces()
        nobien.layer.opacity = 0.5
        //nobien.layer.borderColor = CGColor.init(srgbRed: 200, green: 30, blue: 30, alpha: 0)
    }
    
    @IBAction func mal(_ sender: UIButton) {
        estado = 1
        resetFaces()
        mal.layer.opacity = 0.5
        //mal.layer.borderColor = CGColor.init(srgbRed: 200, green: 30, blue: 30, alpha: 0)
    }
    
    @IBAction func guardar(_ sender: UIButton) {
       //var ref: DatabaseReference!
       // ref = Database.database().reference(fromURL: "https://punto-b84a8.firebaseio.com/")
        userReference.updateChildValues(["Notas": notas.text!])
        
        userReference.updateChildValues(["Estado" : estado])
        
        navigationController?.popToRootViewController(animated: true)
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
