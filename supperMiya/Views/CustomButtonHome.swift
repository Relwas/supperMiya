//
//  CustomButtonHome.swift
//  supperMiya
//
//  Created by relwas on 05/03/23.
//

import UIKit

class CustomButtonHome: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func  setUpButton() {
        setShadow()
        
        setTitleColor(.black, for: .normal)
        contentVerticalAlignment = .center
        contentHorizontalAlignment = .center
        backgroundColor = UIColor.white
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        layer.cornerRadius = 9
        layer.borderColor = UIColor.gray.cgColor
        
    }
    
    private func setShadow() {
        layer.shadowColor       = UIColor.black.cgColor
        layer.shadowOffset      = CGSize(width: 0.5, height: 3.5)
        layer.shadowRadius      = 2
        layer.shadowOpacity     = 0.3
        clipsToBounds           = true
        layer.masksToBounds     = false
    }
    
}

