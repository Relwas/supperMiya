//
//  HomeHeaderView.swift
//  supperMiya
//
//  Created by relwas on 02/03/23.
//

import UIKit

class HomeHeaderView: UIView {
    //MARK: - UI Components
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "super")
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let bannerImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "banner")
        iv.contentMode = .scaleToFill
        iv.backgroundColor = UIColor.systemBackground
        iv.layer.borderWidth = 0.2
        iv.layer.masksToBounds = true
        iv.layer.cornerRadius = 15
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    

   
    // MARK: - LifeCycle
    init() {
        super.init(frame: .zero)
        self.UISetUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UI Setup
    private func UISetUp() {
        
        addSubview(logoImageView)
        addSubview(bannerImageView)
        
        
                NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: topAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 170),
            self.logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            self.bannerImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: -40),
            self.bannerImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.bannerImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.bannerImageView.widthAnchor.constraint(equalToConstant: 390),
            self.bannerImageView.heightAnchor.constraint(equalToConstant: 185),
            
            

        ])
    }
}
