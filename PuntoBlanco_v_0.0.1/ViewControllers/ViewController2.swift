//
//  ViewController2.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Sofia Dorst on 03.11.20.
//

import UIKit
import Firebase

class ViewController2: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    var userReference :DatabaseReference!
    var tablaPrueba = [["Meditacion 1","Meditacion 2","Meditacion 3"],["Meditacion 1","Meditacion 2"],["Meditacion 3"],["Meditacion 4"]]
    var posTabla = 0
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tablaPrueba[posTabla].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        cell.textLabel?.text = tablaPrueba[posTabla][indexPath.row]
        
        cell.backgroundView = UIImageView(image: UIImage(named: "meditacion_1.jpg"))
        
        cell.backgroundView?.alpha = 0.4
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    
    
    var pickerData: [String] = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row]
        
    }
    
    /*
  cell.backgroundView = [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cell_normal.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
     cell.selectedBackgroundView =  [[UIImageView alloc] initWithImage:[ [UIImage imageNamed:@"cell_pressed.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:5.0] ];
     */
    
    @IBOutlet weak var pickView: UIPickerView!
    
    @IBOutlet weak var table: UITableView!
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        posTabla = row
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        pickerData = ["Espiritual", "Visualización", "Movimiento","Tranquilidad"]
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let vistaDetalle = segue.destination as! ViewController3
        if (table.indexPathForSelectedRow == nil){
            vistaDetalle.nombre = tablaPrueba[posTabla][0]
            
        }
        else {
            vistaDetalle.nombre = tablaPrueba[posTabla][table.indexPathForSelectedRow!.row]
            
        }
        print(userReference)
        vistaDetalle.userReference = userReference
        
        
        
    }
    
    

}
