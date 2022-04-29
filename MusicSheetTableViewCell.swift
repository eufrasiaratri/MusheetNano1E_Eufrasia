//
//  MusicSheetTableViewCell.swift
//  Musheet
//
//  Created by Eufrasia Ratri on 29/04/22.
//

import UIKit

class MusicSheetTableViewCell: UITableViewCell {

    @IBOutlet weak var Storage: UILabel!
    @IBOutlet weak var Genre: UILabel!
    @IBOutlet weak var Composer: UILabel!
    @IBOutlet weak var Title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
