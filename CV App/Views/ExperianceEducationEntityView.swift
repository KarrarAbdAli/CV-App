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

    lazy var logoImageDimention: CGFloat =  {
        let numberOfLabels: CGFloat = 3
        let numberOfOffsetsBetweenLabels: CGFloat = 2
        let dimention: CGFloat = (ViewServices.shortLabelHeight * numberOfLabels) + (ViewServices.offset * numberOfOffsetsBetweenLabels)
        return dimention
    }()
    
    //MARK: - Views
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .left
        label.text = "job title"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .left
        label.text = "company"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .left
        label.text = "start date - end date"
        label.textColor = .lightGray
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
        
        let randomImageIndexNumber = Int(Float.random(in: 0.0...2.0))
        let image = UIImage(named: "logo\(randomImageIndexNumber)")
        if let image = image {
            logoImageView.image = image
        }
        
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: ViewServices.offset * 2 ).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: logoImageDimention).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: logoImageDimention).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: ViewServices.offset * 2).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: ViewServices.shortLabelHeight).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: ViewServices.offset).isActive = true
        subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: ViewServices.shortLabelHeight).isActive = true
        
        durationLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: ViewServices.offset).isActive = true
        durationLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor).isActive = true
        durationLabel.trailingAnchor.constraint(equalTo: subtitleLabel.trailingAnchor).isActive = true
        durationLabel.heightAnchor.constraint(equalToConstant: ViewServices.shortLabelHeight).isActive = true
    }
    
}
