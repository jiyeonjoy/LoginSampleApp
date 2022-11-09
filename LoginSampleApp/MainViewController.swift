//
//  MainViewController.swift
//  LoginSampleApp
//
//  Created by Jiyeon Choi on 2022. 11. 9..
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func logoutButtonAction(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
