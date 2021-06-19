//
//  hMeditacionesTableViewCell.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 4/21/21.
//

import UIKit

class hMeditacionesTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreMeditacion: UILabel!
    @IBOutlet weak var fechaMeditacion: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        
//        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
//    }

}
