//
//  CustomTextField.swift
//  supperMiya
//
//  Created by relwas on 26/02/23.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case phoneNumber
        case password
    }
    
    private let authFieldType: CustomTextFieldType

    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 5
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
            
        switch fieldType {
        case .phoneNumber:
            self.placeholder = " +998 90 123 45 67"
            self.keyboardType = .phonePad
        case .password:
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

