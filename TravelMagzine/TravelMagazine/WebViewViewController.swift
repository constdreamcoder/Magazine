//
//  WebViewViewController.swift
//  TravelMagzine
//
//  Created by SUCHAN CHANG on 1/15/24.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String = "https://www.apple.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
    }

}

extension WebViewViewController: ViewControllerUIProtocol {
    func configureUI() {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    func configureNavigation() {
        navigationController?.navigationBar.isHidden = false
    }
    
    
}
