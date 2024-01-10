//
//  TravelMagzineTableViewCell.swift
//  TravelMagzine
//
//  Created by SUCHAN CHANG on 1/8/24.
//

import UIKit

final class TravelMagazineTableViewCell: UITableViewCell {
   
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
}

extension TravelMagazineTableViewCell: TableViewCellUIProtocol {
    func configureUI() {
        photoImageView.layer.cornerRadius = 10
        photoImageView.contentMode = .scaleToFill
        
        titleLabel.font = .boldSystemFont(ofSize: 19.0)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black
        
        subtitleLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = .lightGray
        
        dateLabel.textAlignment = .right
        dateLabel.textColor = .lightGray
        dateLabel.font = .systemFont(ofSize: 12.0, weight: .semibold)
    }
}
