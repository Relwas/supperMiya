//
//  CustomButton.swift
//  supperMiya
//
//  Created by relwas on 27/02/23.
//

import UIKit

class CustomButton: UIButton {

    enum FontSize {
        case big
        case small
    }

    init(title: String, hasBAckground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 7
        self.layer.masksToBounds = true
        
        self.backgroundColor = hasBAckground ? UIColor(red: 0.84, green: 0.58, blue: 0.34, alpha: 1.00) : .clear
        
        let titleColor: UIColor = hasBAckground ? .white : .systemBlue
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case  .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16 , weight: .semibold)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
