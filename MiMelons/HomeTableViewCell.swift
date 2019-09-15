//
//  HomeTableViewCell.swift
//  MiMelons
//
//  Created by Sophie Qin on 2019-09-14.
//  Copyright © 2019 Sophie Qin. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var symptomImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = Theme.backgroundColor()
        dateLabel.textColor = Theme.textColor()
        containerView.layer.cornerRadius = 6
        containerView.layer.shadowColor = Theme.shadowColor().cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 7)
        containerView.layer.shadowRadius = 15 / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
