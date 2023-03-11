//
//  AuthHeaderView.swift
//  supperMiya
//
//  Created by relwas on 26/02/23.
//

import UIKit

class AuthHeaderView: UIView {
    
    
    // MARK: - UI Components
    private let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "super")
        iv.tintColor = .white
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.text = "Error"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    // MARK: - LifeCycle
    init(infoTitle: String) {
        super.init(frame: .zero)
        self.infoLabel.text = infoTitle
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - UI SetUp
    private func setUpUI() {
        self.addSubview(logoImageView)
        self.addSubview(infoLabel)
        
       

        NSLayoutConstraint.activate([
            self.logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 165),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 80),
            self.logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            self.infoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.infoLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30)
        ])
    }
}
