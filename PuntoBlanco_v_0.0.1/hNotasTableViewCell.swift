//
//  hNotasTableViewCell.swift
//  PuntoBlanco_v_0.0.1
//
//  Created by user189325 on 4/21/21.
//

import UIKit

class hNotasTableViewCell: UITableViewCell {

    @IBOutlet weak var nombreNotas: UILabel!
    @IBOutlet weak var fechaNota: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
