//
//  TravelMagzineTableViewCell.swift
//  TravelMagzine
//
//  Created by SUCHAN CHANG on 1/8/24.
//

import UIKit

class TravelMagazineTableViewCell: UITableViewCell {
   
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configureUI() {
        photoImageView.layer.cornerRadius = 10
    }
    
}
