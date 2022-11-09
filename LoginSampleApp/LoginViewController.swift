//
//  LoginViewController.swift
//  LoginSampleApp
//
//  Created by Jiyeon Choi on 2022. 11. 9..
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailLoginButton: UIButton!
    @IBOutlet weak var googleLoginButton: UIButton!
    @IBOutlet weak var appleLoginButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Navigation Bar 가리기
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //이메일/비밀번호로 계속하기 버튼 UI
        self.emailLoginButton.layer.cornerRadius = 30
        self.emailLoginButton.layer.borderWidth = 1
        self.emailLoginButton.layer.borderColor = UIColor.white.cgColor
        
        //Google로 계속하기 버튼 UI
        self.googleLoginButton.layer.cornerRadius = 30
        self.googleLoginButton.layer.borderWidth = 1
        self.googleLoginButton.layer.borderColor = UIColor.white.cgColor
        
        //Apple로 계속하기 버튼 UI
        self.appleLoginButton.layer.cornerRadius = 30
        self.appleLoginButton.layer.borderWidth = 1
        self.appleLoginButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
}
