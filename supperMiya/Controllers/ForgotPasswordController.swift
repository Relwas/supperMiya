//
//  ForgotPasswordController.swift
//  supperMiya
//
//  Created by relwas on 26/02/23.
//

import UIKit

class ForgotPasswordController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Variables
    
    
    // MARK: - UI Components
    private let headerView = AuthHeaderView(infoTitle: "Telefon raqamingiz")
    
    private let phoneNumberField = CustomTextField(fieldType: .phoneNumber)
    
    private let resetPasswordButton = CustomButton(title: "Qayta tiklash", hasBAckground: true, fontSize: .big)
    
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        self.resetPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        phoneNumberField.delegate = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    
    
    // MARK: - UI Setup
    func setUpUI() {
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(headerView)
        self.view.addSubview(phoneNumberField)
        self.view.addSubview(resetPasswordButton)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 45),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 400),
            
            self.phoneNumberField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -20),
            self.phoneNumberField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.phoneNumberField.heightAnchor.constraint(equalToConstant: 55),
            self.phoneNumberField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.resetPasswordButton.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 20),
            self.resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            self.resetPasswordButton .widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
        ])
    }
    
    
    //MARK: Selector
    @objc private func didTapForgotPassword() {
        guard let phoneNumber = phoneNumberField.text, !phoneNumber.isEmpty else { return }
        // TODO: Phone Validation
    }
    
    //MARK: - Formatting Phone number
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
