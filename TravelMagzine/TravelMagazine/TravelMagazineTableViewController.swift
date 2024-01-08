//
//  TravelMagzineTableViewController.swift
//  TravelMagzine
//
//  Created by SUCHAN CHANG on 1/8/24.
//

import UIKit
import Kingfisher

struct Magazine {
    let title: String
    let subtitle: String
    let photo_image: String
    let date: String
    let link: String
}

class TravelMagazineTableViewController: UITableViewController {
    let magazineList: [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineTableViewCell", for: indexPath) as! TravelMagazineTableViewCell
        
        cell.configureUI()
        
        let magazine = magazineList[indexPath.row]
        
        let placeholderImage = UIImage(named: "no_image")
        let imageUrl = URL(string: magazine.photo_image)
        cell.photoImageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
        cell.titleLabel.text = magazine.title
        cell.subtitleLabel.text = magazine.subtitle
        cell.dateLabel.text = getDate(dateString: magazine.date)
        
        return cell
    }
    
    func getDate(dateString: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyMMdd"
        
        guard let date = inputDateFormatter.date(from: dateString) else { return "" }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yy년 MM월 dd일"
        
        return outputDateFormatter.string(from: date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
}
