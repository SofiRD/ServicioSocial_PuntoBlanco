//
//  NotificacionTableViewCell.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 6/7/21.
//

import UIKit

class NotificacionTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbDesc: UILabel!
    @IBOutlet weak var lbDate: UILabel!
    
    @IBOutlet weak var NotificationView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
