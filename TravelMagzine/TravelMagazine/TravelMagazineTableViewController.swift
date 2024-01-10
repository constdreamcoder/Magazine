//
//  TravelMagzineTableViewController.swift
//  TravelMagzine
//
//  Created by SUCHAN CHANG on 1/8/24.
//

import UIKit
import Kingfisher

final class TravelMagazineTableViewController: UITableViewController {
    
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
    let magazineList: [Magazine] = MagazineInfo().magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTopUI()
        configureTableViewUI()
    }
}

// MARK: - TravelMagazineTableViewController UI Methods
extension TravelMagazineTableViewController: TravelMagazineTableViewControllerUIProtocol {
    func configureTopUI() {
        topImageView.image = UIImage(systemName: "ellipsis")
        topImageView.tintColor = .lightGray
        topImageView.contentMode = .scaleAspectFit
        
        topTitleLabel.text = "SeSAC TRAVEL"
        topTitleLabel.textColor = .black
        topTitleLabel.textAlignment = .center
        topTitleLabel.font = .systemFont(ofSize: 20.0, weight: .semibold)
        
        separatorView.backgroundColor = .systemGray5
    }
}

// MARK: - TableView UI Configuration
extension TravelMagazineTableViewController: TableViewUIProtocol {
    func configureTableViewUI() {
        tableView.separatorStyle = .none
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 460
    }
}

// MARK: - TableView Delegate, Datasource Methods
extension TravelMagazineTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazineList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TravelMagazineTableViewCell", for: indexPath) as! TravelMagazineTableViewCell
                
        let magazine = magazineList[indexPath.row]
        
        let placeholderImage = UIImage(named: "no_image")
        let imageUrl = URL(string: magazine.photo_image)
        cell.photoImageView.kf.setImage(with: imageUrl, placeholder: placeholderImage)
        cell.titleLabel.text = magazine.title
        cell.subtitleLabel.text = magazine.subtitle
        cell.dateLabel.text = getDate(dateString: magazine.date)
        
        return cell
    }
}

// MARK: - TableView Methods
extension TravelMagazineTableViewController: TableViewMethodsProtocol {
    func getDate(dateString: String) -> String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = "yyMMdd"
        
        guard let date = inputDateFormatter.date(from: dateString) else { return "" }
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "yy년 MM월 dd일"
        
        return outputDateFormatter.string(from: date)
    }
}

