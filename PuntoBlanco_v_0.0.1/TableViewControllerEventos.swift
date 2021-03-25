//
//  TableViewControllerEventos.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by Andrea Ramirez on 11/20/20.
//

import UIKit
import Firebase

class TableViewControllerEventos: UITableViewController {
    
    var userReference :DatabaseReference!
    /*
    var components = DateComponents()
    let calendar = Calendar.current
    var fechaDefault = Date()
    var fecha1 = Date()
    var fecha2 = Date()
    var fecha3 = Date()
    var fecha4 = Date()
    
    func getDate() -> Void{
        
        //var components = DateComponents()
        components.day = 1
        components.month = 12
        components.year = 2010
        components.hour = 19
        components.minute = 00
        fecha1 = calendar.date(from: components) ?? fechaDefault
        
        components.day = 11
        components.month = 02
        components.year = 2021
        components.hour = 19
        components.minute = 00
        fecha2 = calendar.date(from: components) ?? fechaDefault
        
        components.day = 25
        components.month = 1
        components.year = 2011
        components.hour = 2
        components.minute = 15
        fecha3 = calendar.date(from: components) ?? fechaDefault
        
        components.day = 25
        components.month = 1
        components.year = 2011
        components.hour = 2
        components.minute = 15
        fecha4 = calendar.date(from: components) ?? fechaDefault
    }
    
    
    */
    

    var listaEventos = [Evento(nombreEvento: "Música para el alma: Chello", idEvento: 1, fecha: "1/12/2020 19:00", descripcion: "Disfruta de una experiencia sensible y relajante. Conecta con tu interior a través de la música emotiva del chello.",isRegistered: false),
                        Evento(nombreEvento: "Música para el alma: Arpa", idEvento: 2, fecha: "11/02/2021 19:00", descripcion: "Enamórate de la magia del arpa y regálate un momento de relajación.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Felicidad: Danza Africana", idEvento: 3, fecha: "25/03/2021 11:00", descripcion: "Con esto en mente, la danza africana es una meditación en movimiento que mueve el alma a través de la activación del cuerpo y la consciencia de cada movimiento, de las vibraciones sentidas por el ritmo del tambor y los pasos de quienes nos acompañan en esta celebración del corazón.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Tierra: Cartas a la Tierra", idEvento: 4, fecha: "22/04/2021 11:00", descripcion: "Meditación guiada y reflexión a través de los poemas del maestro zen vietnamita Thich Nath Hanh",isRegistered: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("eventos:")
        print(userReference)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaEventos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = listaEventos[indexPath.row].nombreEvento
        cell.detailTextLabel?.text = listaEventos[indexPath.row].descripcion

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaDetalle = segue.destination as! ViewControllerEventosInfo
        let indice = tableView.indexPathForSelectedRow!
        vistaDetalle.unEvento = listaEventos[indice.row]
        vistaDetalle.userReference = userReference
    }

}
