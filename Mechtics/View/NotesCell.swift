//
//  NotesCell.swift
//  Mechtics
//
//  Created by PARTH on 07/02/22.
//

import UIKit

class NotesCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cornerRadius = 20
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
