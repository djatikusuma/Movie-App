//
//  ListCell.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 16/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var releaseDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
