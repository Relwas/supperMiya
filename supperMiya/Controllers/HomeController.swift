//
//  HomeController.swift
//  supperMiya
//
//  Created by relwas on 26/02/23.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - UI Components
    private let headerView = HomeHeaderView()
    
    private let numbersButton = CustomButtonHome()
    private let wordsButton = CustomButtonHome()
    private let flashCardsButton = CustomButtonHome()
    private let playingCardsButton = CustomButtonHome()
    private let faceAndNamesButton = CustomButtonHome()
    private let datesButton = CustomButtonHome()
    
    
    let bannerInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.layer.masksToBounds = true
        label.sizeToFit()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        label.textAlignment = .left
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 19, weight: .bold)
        label.text = "  Chet tili so'zlari va imtihon javoblarini 10 barobar tezroq eslab qolish usuli"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let directionsTitelLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .center
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.text = "Yo'nalishlar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let learnButton: UIButton = {
        let button = UIButton()
        button.setTitle("O'rganish", for: .normal)
        button.layer.borderWidth = 0.2
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.cornerRadius = 14
        button.setTitleColor(UIColor(red: 0.84, green: 0.58, blue: 0.34, alpha: 1.00), for: .normal)
        button.backgroundColor = .white
        return  button
    }()
    
    let soonPlayingCardsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .label
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Playing Cards (Tez kunda)"
        return label
    }()
    
    let soonFaceAndNamesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Yuz va ismlar (Tez kunda)"
        return label
    }()
    
    let soonDatesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .label
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = "Sanalar (Tez kunda)"
        return label
    }()

    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        learnButton.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        numbersButton.addTarget(self, action: #selector(didTap1), for: .touchUpInside)
        self.setUpUI()
        
    }
    
    //MARK: - UI Setup
    private func setUpUI() {
        
        
        self.view.backgroundColor = .systemBackground

        self.view.addSubview(headerView)
        self.view.addSubview(bannerInfoLabel)
        self.view.addSubview(learnButton)
        self.view.addSubview(directionsTitelLabel)
        
        self.view.addSubview(numbersButton)
        self.view.addSubview(wordsButton)
        self.view.addSubview(flashCardsButton)
        self.view.addSubview(playingCardsButton)
        self.view.addSubview(faceAndNamesButton)
        self.view.addSubview(datesButton)
        self.playingCardsButton.addSubview(soonPlayingCardsLabel)
        self.faceAndNamesButton.addSubview(soonFaceAndNamesLabel)
        self.datesButton.addSubview(soonDatesLabel)
        
        setUpTitleButtons()
        stackView()
        imageForButtons()
        
        learnButton.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        learnButton.translatesAutoresizingMaskIntoConstraints = false
        directionsTitelLabel.translatesAutoresizingMaskIntoConstraints = false
        
        numbersButton.translatesAutoresizingMaskIntoConstraints = false
        wordsButton.translatesAutoresizingMaskIntoConstraints = false
        flashCardsButton.translatesAutoresizingMaskIntoConstraints = false
        playingCardsButton.translatesAutoresizingMaskIntoConstraints = false
        faceAndNamesButton.translatesAutoresizingMaskIntoConstraints = false
        datesButton.translatesAutoresizingMaskIntoConstraints = false
        
        soonPlayingCardsLabel.translatesAutoresizingMaskIntoConstraints = false
        soonFaceAndNamesLabel.translatesAutoresizingMaskIntoConstraints = false
        soonDatesLabel.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5),
            self.headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.headerView.widthAnchor.constraint(equalToConstant: 150),
          
            self.bannerInfoLabel.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 150),
            self.bannerInfoLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -125),
            self.bannerInfoLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
          
            self.learnButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 255),
            self.learnButton.rightAnchor.constraint(equalTo: bannerInfoLabel.rightAnchor, constant: -100),
            self.learnButton.leftAnchor.constraint(equalTo: bannerInfoLabel.leftAnchor, constant: -10),
            self.learnButton.heightAnchor.constraint(equalToConstant: 45),
     
            self.directionsTitelLabel.topAnchor.constraint(equalTo: learnButton.topAnchor, constant: 105),
            self.directionsTitelLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
          
            self.numbersButton.heightAnchor.constraint(equalToConstant: 110),
            self.numbersButton.widthAnchor.constraint(equalToConstant: 110),
  
            self.wordsButton.heightAnchor.constraint(equalToConstant: 110),
            self.wordsButton.widthAnchor.constraint(equalToConstant: 110),
           
            self.flashCardsButton.heightAnchor.constraint(equalToConstant: 110),
            self.flashCardsButton.widthAnchor.constraint(equalToConstant: 110),
            
            self.playingCardsButton.heightAnchor.constraint(equalToConstant: 110),
            self.playingCardsButton.widthAnchor.constraint(equalToConstant: 110),
            
            self.faceAndNamesButton.heightAnchor.constraint(equalToConstant: 110),
            self.faceAndNamesButton.widthAnchor.constraint(equalToConstant: 110),
            
            self.datesButton.heightAnchor.constraint(equalToConstant: 110),
            self.datesButton.widthAnchor.constraint(equalToConstant: 110),
            
            self.soonPlayingCardsLabel.bottomAnchor.constraint(equalTo: playingCardsButton.bottomAnchor),
            self.soonPlayingCardsLabel.widthAnchor.constraint(equalToConstant: 100),
            self.soonPlayingCardsLabel.heightAnchor.constraint(equalToConstant: 40),
            self.soonPlayingCardsLabel.leftAnchor.constraint(equalTo: playingCardsButton.leftAnchor, constant: 5),
            
            self.soonFaceAndNamesLabel.bottomAnchor.constraint(equalTo: faceAndNamesButton.bottomAnchor),
            self.soonFaceAndNamesLabel.widthAnchor.constraint(equalToConstant: 100),
            self.soonFaceAndNamesLabel.heightAnchor.constraint(equalToConstant: 40),
            self.soonFaceAndNamesLabel.leftAnchor.constraint(equalTo: faceAndNamesButton.leftAnchor, constant: 5),
            
            self.soonDatesLabel.bottomAnchor.constraint(equalTo: datesButton.bottomAnchor),
            self.soonDatesLabel.widthAnchor.constraint(equalToConstant: 100),
            self.soonDatesLabel.heightAnchor.constraint(equalToConstant: 40),
            self.soonDatesLabel.leftAnchor.constraint(equalTo: datesButton.leftAnchor, constant: 5)

        ])
        
        func stackView() {
            let firstStackView =  UIStackView(arrangedSubviews: [numbersButton, wordsButton, flashCardsButton])
            self.view.addSubview(firstStackView)
            firstStackView.axis = .horizontal
            firstStackView.distribution = .fillEqually
            firstStackView.spacing = 9
            firstStackView.translatesAutoresizingMaskIntoConstraints = false
            firstStackView.topAnchor.constraint(equalTo: directionsTitelLabel.topAnchor, constant: 50).isActive = true
            firstStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            firstStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true

            let seconCtackView =  UIStackView(arrangedSubviews: [playingCardsButton, faceAndNamesButton, datesButton])
            self.view.addSubview(seconCtackView)
            seconCtackView.axis = .horizontal
            seconCtackView.alignment = .bottom
            seconCtackView.distribution = .fillEqually
            seconCtackView.spacing = 9
            seconCtackView.translatesAutoresizingMaskIntoConstraints = false
            seconCtackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 20).isActive = true
            seconCtackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            seconCtackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        }
        
        func setUpTitleButtons() {
            numbersButton.setTitle("Raqamlar", for: .normal)
            wordsButton.setTitle("So'zlar", for: .normal)
            flashCardsButton.setTitle("Flash Cards", for: .normal)
        }
        func imageForButtons() {
            numbersButton.setImage(UIImage(systemName: "number"), for: .normal)
            wordsButton.setImage(UIImage(systemName: "books.vertical"), for: .normal)
            flashCardsButton.setImage(UIImage(systemName: "a"), for: .normal)
            numbersButton.contentMode = .center
//            faceAndNamesButton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)

        }
}
   
    
    //MARK: - Selectors
    @objc private func didTap() {
        if let url = URL(string: "https://youtu.be/dQw4w9WgXcQ") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func didTap1() {
        print("Hello")
    }
    
}
