//
//  ViewController5.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 18.11.20.
//

import UIKit
import Firebase

class ViewController5: UIViewController{
    
    
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
    
    @IBAction func feliz(_ sender: UIButton) {
        estado = 5
        feliz.imageView?.alpha = 0.5
        medio.imageView?.alpha = 1
        meh.imageView?.alpha = 1
        nobien.imageView?.alpha = 1
        mal.imageView?.alpha = 1    }
    @IBAction func medio(_ sender: UIButton) {
        estado = 4
        medio.imageView?.alpha = 0.5
        feliz.imageView?.alpha = 1
        meh.imageView?.alpha = 1
        nobien.imageView?.alpha = 1
        mal.imageView?.alpha = 1
    }
    
    @IBAction func meh(_ sender: UIButton) {
        estado = 3
        meh.imageView?.alpha = 0.5
        medio.imageView?.alpha = 1
        feliz.imageView?.alpha = 1
        nobien.imageView?.alpha = 1
        mal.imageView?.alpha = 1    }
    @IBAction func nobien(_ sender: UIButton) {
        estado = 2
        nobien.imageView?.alpha = 0.5
        medio.imageView?.alpha = 1
        meh.imageView?.alpha = 1
        feliz.imageView?.alpha = 1
        mal.imageView?.alpha = 1    }
    @IBAction func mal(_ sender: UIButton) {
        estado = 1
        mal.backgroundColor = UIColor.red
        medio.imageView?.alpha = 1
        meh.imageView?.alpha = 1
        nobien.imageView?.alpha = 1
        feliz.imageView?.alpha = 1    }
    
    @IBAction func guardar(_ sender: UIButton) {
       var ref: DatabaseReference!
        ref = Database.database().reference(fromURL: "https://punto-b84a8.firebaseio.com/")
        ref.updateChildValues(["Notas": notas.text!])
        
        ref.updateChildValues(["Estado" : estado])
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
