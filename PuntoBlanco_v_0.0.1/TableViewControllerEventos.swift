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
    

    var listaEventos = [Evento(nombreEvento: "Música para el alma: Chello", idEvento: 1, imagen: (UIImage(named: "meditacion_1") ?? UIImage(named: "meditacion_1"))!, fecha: "1/12/2020 19:00", descripcion: "Disfruta de una experiencia sensible y relajante. Conecta con tu interior a través de la música emotiva del chello.",isRegistered: false),
                        Evento(nombreEvento: "Música para el alma: Arpa", idEvento: 2,imagen: (UIImage(named: "meditacion_2") ?? UIImage(named: "meditacion_1"))!, fecha: "11/02/2021 19:00", descripcion: "Enamórate de la magia del arpa y regálate un momento de relajación.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Felicidad: Danza Africana", idEvento: 3,imagen: (UIImage(named: "meditacion_3") ?? UIImage(named: "meditacion_1"))!, fecha: "25/03/2021 11:00", descripcion: "Con esto en mente, la danza africana es una meditación en movimiento que mueve el alma a través de la activación del cuerpo y la consciencia de cada movimiento, de     las vibraciones sentidas por el ritmo del tambor y los pasos de quienes nos acompañan en esta celebración del corazón.",isRegistered: false),
                        Evento(nombreEvento: "Día de la Tierra: Cartas a la Tierra", idEvento: 4,imagen: (UIImage(named: "meditacion_4") ?? UIImage(named: "meditacion_1"))!, fecha: "22/04/2021 11:00", descripcion: "Meditación guiada y reflexión a través de los poemas del maestro zen vietnamita Thich Nath Hanh" ,isRegistered: false)]	
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("eventos:")
        print(userReference)
        self.navigationController?.navigationBar.layer.cornerRadius = 20
        self.navigationController?.navigationBar.clipsToBounds = true
        self.navigationController?.navigationBar.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2507135272, green: 0.7050949335, blue: 0.6889640093, alpha: 1)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! EventTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none

        // Configure the cell...
        
        
        cell.cellImageBackground?.image = listaEventos[indexPath.row].imagen
        cell.cellImageBackground.alpha = 0.5
        cell.titleLabel?.text = listaEventos[indexPath.row].nombreEvento
        cell.dateLabel?.text = listaEventos[indexPath.row].fecha
        
        
        cell.titleLabel?.font = cell.titleLabel?.font.withSize(self.view.frame.height * 0.046)
        
        cell.dateLabel?.font = cell.dateLabel?.font.withSize(self.view.frame.height * 0.03)
        
        cell.cellImageBackground?.layer.cornerRadius = cell.cellImageBackground.frame.size.width / 18
        cell.cellImageBackground?.clipsToBounds = true
        
        switch UIDevice.current.orientation {
        case .portrait:
            cell.titleLabel?.font = cell.titleLabel?.font.withSize(self.view.frame.height * 0.046)
            cell.dateLabel?.font = cell.dateLabel?.font.withSize(self.view.frame.height * 0.03)
        case .landscapeLeft:
            cell.titleLabel?.font = cell.titleLabel?.font.withSize(self.view.frame.width * 0.046)
            cell.dateLabel?.font = cell.dateLabel?.font.withSize(self.view.frame.width * 0.03)
        case .landscapeRight:
            cell.titleLabel?.font = cell.titleLabel?.font.withSize(self.view.frame.width * 0.046)
            cell.dateLabel?.font = cell.dateLabel?.font.withSize(self.view.frame.width * 0.03)
        default:
            cell.titleLabel?.font = cell.titleLabel?.font.withSize(self.view.frame.height * 0.046)
            cell.dateLabel?.font = cell.dateLabel?.font.withSize(self.view.frame.height * 0.03)
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let screenSize: CGRect = UIScreen.main.bounds
        return UIScreen.main.bounds.width/1.75
    }
    
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

    
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
