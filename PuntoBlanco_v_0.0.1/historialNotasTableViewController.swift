//
//  historialNotasTableViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 4/19/21.
//

import UIKit

class historialNotasTableViewController: UITableViewController {
    
    var listaMeditaciones = [Meditacion(nombreMeditacion: "Zen", tipoMeditacion: "chill", ritmoCardIni: 84, ritmoCardFin: 75, nota: "Mejorando mi ser", estadoAnimo: "feliz", fecha: "11/02/2021 19:00"), Meditacion(nombreMeditacion: "Mantra", tipoMeditacion: "Mantra", ritmoCardIni: 82, ritmoCardFin: 87, estadoAnimo: "regular", fecha: "22/04/2021 11:00")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    } 

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        var count = 0
        
        for i in 0..<listaMeditaciones.count{
            if (listaMeditaciones[i].nota != nil){
                count+=1
            }
        }
        return count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNotas", for: indexPath) as! hNotasTableViewCell
        
        if (listaMeditaciones[indexPath.row].nota != nil){
            cell.nombreNotas.text = listaMeditaciones[indexPath.section].nota
            cell.fechaNota.text = listaMeditaciones[indexPath.section].fecha
            cell.nombreNotas.textColor = .white
            cell.fechaNota.textColor = .white
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 8
            cell.clipsToBounds = true
            if indexPath.section % 3 == 0 {
                cell.backgroundColor = UIColor(red: 51/255, green: 65/255, blue: 149/255, alpha: 0.7)
            }else if indexPath.section % 2 == 0{
                cell.backgroundColor = UIColor(red: 40/255, green: 150/255, blue: 90/255, alpha: 0.7)
            }else{
                cell.backgroundColor = UIColor(red: 244/255, green: 91/255, blue: 105/255, alpha: 0.7)
            }
        }
        

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
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
