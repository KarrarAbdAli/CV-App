//
//  ExperianceEducationEntityView.swift
//  CV App
//
//  Created by Karrar Abd Ali on 28/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class ExperianceEducationEntityView: UIView {
    //MARK: - Variable
    private let offset: CGFloat = 10
    lazy var imageDimention: CGFloat = {
        return self.frame.height * 0.8
       }()
    //MARK: - Views
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        let randImageLogoNumber = Int.random(in: 1...3)
        let image = UIImage(named: "logo")
        if let image = image {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "iOS Developer"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "Digital IT"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "Jan 2019 - Mar 2020"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(frame: CGRect, titleText: String, subtitleText: String, durationText: String) {
        self.init(frame: frame)
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
        durationLabel.text = durationText
    }
    //MARK: - Private Methods
    private func setupViews(){
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(durationLabel)
        
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: offset ).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: imageDimention).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: imageDimention).isActive = true
        logoImageView.rightAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: -offset).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: offset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: offset/2).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: imageDimention/3).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: imageDimention/3).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        durationLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: imageDimention/3).isActive = true
    }
    
}
