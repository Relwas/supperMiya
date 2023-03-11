//
//  LoginController.swift
//  supperMiya
//
//  Created by relwas on 26/02/23.
//

import UIKit

class LoginController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(infoTitle: "Telefon raqamingiz")
    
    private let phoneNumberField = CustomTextField(fieldType: .phoneNumber)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Kirish", hasBAckground: true, fontSize: .big)
    private let forgotPasswordButton = CustomButton(title: "Parolni esdan chiqardingizmi?", fontSize: .small)
    
    private let passwordLabelInfo: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Parolingiz"
        return label
    }()
    
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        
        navigationItem.backButtonTitle = "Ortga"
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        self.forgotPasswordButton .addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        phoneNumberField.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - SetUp UI
    private func setUpUI() {
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(headerView)
        self.view.addSubview(phoneNumberField)
        self.view.addSubview(passwordField)
        self.view.addSubview(signInButton)
        self.view.addSubview(forgotPasswordButton)                          
        self.view.addSubview(passwordLabelInfo)
        
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        passwordLabelInfo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 222),
            
            self.phoneNumberField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 70),
            self.phoneNumberField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.phoneNumberField.heightAnchor.constraint(equalToConstant: 55),
            self.phoneNumberField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordLabelInfo.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 25),
            self.passwordLabelInfo.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordLabelInfo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            self.passwordLabelInfo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            self.passwordLabelInfo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: -95),
            
            self.passwordField.topAnchor.constraint(equalTo: passwordLabelInfo.bottomAnchor, constant : 6),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 55),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant : 40),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 55),
            self.signInButton .widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 11),
            self.forgotPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 44),
            self.forgotPasswordButton .widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    
    //MARK: - Selectors
    @objc func didTapSignIn() {
        let vc = HomeController()
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    @objc func didTapForgotPassword() {
        let vc = ForgotPasswordController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Formatting Phone number methods
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "+XXX XX XXX-XX-XX", phone: newString)
        return false
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        
        // iterate over the mask characters until the iterator of numbers ends
        for ch in mask where index < numbers.endIndex {
            if ch == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                
                // move numbers iterator to the next index
                index = numbers.index(after: index)
                
            } else {
                result.append(ch) // just append a mask character
            }
        }
        return result
    }
    
    
}
