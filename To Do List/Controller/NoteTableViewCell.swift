//
//  NoteTableViewCell.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    @IBOutlet weak var noteText: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
