//
//  ViewControllerNotificacion.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user179426 on 11/5/20.
//

import UIKit
import Firebase

class ViewControllerNotificacion: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var userReference :DatabaseReference!
    var listaNotificaciones : [Notificacion] = []
    @IBOutlet weak var notificacionTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaNotificaciones.sort{
            $0.sortDate > $1.sortDate
        }
        print("notis:")
        print(userReference)
        preferredContentSize = CGSize(width: view.frame.size.width * 0.7, height: view.frame.size.height / 2)
        
        notificacionTableView.delegate = self
        notificacionTableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return listaNotificaciones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaNot", for: indexPath) as! NotificacionTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        
        cell.lbDate.text = listaNotificaciones[indexPath.section].fecha
        cell.lbDate.textColor = .white
        
        cell.lbDesc.text = listaNotificaciones[indexPath.section].desc
        cell.lbDesc.textColor = .white
        
        cell.lbTitle.text = listaNotificaciones[indexPath.section].title
        cell.lbTitle.textColor = .white
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        
        cell.NotificationView.backgroundColor = #colorLiteral(red: 0.2217928171, green: 0.6071980596, blue: 0.5950975418, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0.2217928171, green: 0.6071980596, blue: 0.5950975418, alpha: 1)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }

//    // Make the background color show through
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//           let headerView = UIView()
//           headerView.backgroundColor = UIColor.clear
//           return headerView
//       }
    

}
