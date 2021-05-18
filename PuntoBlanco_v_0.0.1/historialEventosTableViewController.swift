//
//  historialEventosTableViewController.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 4/19/21.
//

import UIKit

class historialEventosTableViewController: UITableViewController {

    var listaEventos = [Evento(nombreEvento: "Música para el alma: Chello", idEvento: 1, imagen: (UIImage(named: "meditacion_1") ?? UIImage(named: "meditacion_1"))!, fecha: "1/12/2020 19:00", descripcion: "Disfruta de una experiencia sensible y relajante. Conecta con tu interior a través de la música emotiva del chello.",isRegistered: false),
                        Evento(nombreEvento: "Música para el alma: Arpa", idEvento: 2,imagen: (UIImage(named: "meditacion_2") ?? UIImage(named: "meditacion_1"))!, fecha: "11/02/2021 19:00", descripcion: "Enamórate de la magia del arpa y regálate un momento de relajación.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Felicidad: Danza Africana", idEvento: 3,imagen: (UIImage(named: "meditacion_3") ?? UIImage(named: "meditacion_1"))!, fecha: "25/03/2021 11:00", descripcion: "Con esto en mente, la danza africana es una meditación en movimiento que mueve el alma a través de la activación del cuerpo y la consciencia de cada movimiento, de     las vibraciones sentidas por el ritmo del tambor y los pasos de quienes nos acompañan en esta celebración del corazón.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Tierra: Cartas a la Tierra", idEvento: 4,imagen: (UIImage(named: "meditacion_4") ?? UIImage(named: "meditacion_1"))!, fecha: "22/04/2021 11:00", descripcion: "Meditación guiada y reflexión a través de los poemas del maestro zen vietnamita Thich Nath Hanh" ,isRegistered: false)]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = CGSize(width: view.frame.size.width * 0.9, height: view.frame.size.height / 2)
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
        return listaEventos.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    // Make the background color show through
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaEventos", for: indexPath) as! hEventosTableViewCell
        cell.nombreEvento.text = listaEventos[indexPath.section].nombreEvento
        cell.fechaEvento.text = listaEventos[indexPath.section].fecha
        cell.nombreEvento.textColor = .white
        cell.fechaEvento.textColor = .white
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
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let vistaDetalle = segue.destination as! EventoViewController
        let indice = self.tableView.indexPathForSelectedRow?.section
        vistaDetalle.unEvento = listaEventos[indice!]
        //vistaDetalle.userReference = userReference
    }
}
