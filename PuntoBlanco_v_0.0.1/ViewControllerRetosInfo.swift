//
//  ViewControllerRetosInfo.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 11/19/20.
//

import UIKit
import Firebase

class ViewControllerRetosInfo: UIViewController {
    
    var userReference :DatabaseReference!
    var unReto: Reto!
    
    
    @IBOutlet weak var lbNombreReto: UILabel!
    @IBOutlet weak var lbDescReto: UILabel!
    @IBOutlet weak var btLink: UIButton!
    @IBOutlet weak var btRegistro: UIButton!
    @IBOutlet weak var lbRegistro: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("retos2:")
        print(userReference)
        // Do any additional setup after loading the view.
        title = "Detalle Reto"

        lbNombreReto.text = unReto.nombreReto
        lbDescReto.text = unReto.descripcion
        
        if(!unReto.isRegistered){
            lbRegistro.alpha = 0
            btRegistro.setTitle("Registrarme", for: .normal)
        }else{
            lbRegistro.alpha = 1
            btRegistro.setTitle("Cancelar registro", for: .normal)
        }

    }
    

    @IBAction func abrirURL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://us4.campaign-archive.com/?u=095f98febbd304a28ec2fcb3e&id=86c977feec")! as URL, options: [:], completionHandler: nil)
    }

    
    @IBAction func registrar(_ sender: UIButton) {
        if(unReto.isRegistered){
            unReto.isRegistered = false
            lbRegistro.alpha = 0
            btRegistro.setTitle("Registrarme", for: .normal)
            //aquí se debe manipular la base de datos
        }else{
            unReto.isRegistered = true
            lbRegistro.alpha = 1
            btRegistro.setTitle("Cancelar registro", for: .normal)
            //aquí se debe manipular la base de datos
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
