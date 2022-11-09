//
//  EnterEmailViewController.swift
//  LoginSampleApp
//
//  Created by Jiyeon Choi on 2022. 11. 9..
//

import UIKit
import FirebaseAuth

class EnterEmailViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorDescriptionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //이메일 주소 입력 활성화
        self.emailTextField.becomeFirstResponder()
        
        //다음 버튼 UI
        self.nextButton.layer.cornerRadius = 30
        
        //다음 버튼 비활성화
        self.nextButton.isEnabled = false
        
        //UITextField Delegate
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Navigation Bar 보이기
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        //Firebase 이메일, 비밀번호 인증
        let email = self.emailTextField.text ?? ""
        let password = self.passwordTextField.text ?? ""
        
        //신규 사용자 생성
        Auth.auth().createUser(withEmail: email, password: password) {[weak self] authResult, error in
            guard let self = self else { return }

            self.showMainViewController()
        }
    }
    
    ///Main 화면으로 보내기
    func showMainViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let mainViewController = storyboard.instantiateViewController(identifier: "MainViewController")
        mainViewController.modalPresentationStyle = .fullScreen
        self.navigationController?.show(mainViewController, sender: nil)
    }
}

extension EnterEmailViewController: UITextFieldDelegate {
    //키보드 내려가기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isEmailEmpty = self.emailTextField.text == ""
        let isPasswordEmpty = self.passwordTextField.text == ""
        self.nextButton.isEnabled = !isEmailEmpty && !isPasswordEmpty
    }
}
