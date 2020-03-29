//
//  TiitleFieldCell.swift
//  CV App
//
//  Created by Karrar Abd Ali on 27/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class TitleFieldCell: UICollectionViewCell {
    //MARK: - Variables
    var imageDimention: CGFloat = 100
    private var offset: CGFloat = 5
    private var labelHeight: CGFloat = 15
    var cv: CV? {
        didSet {
            guard let cv = cv else { return }
            nameLabel.text = cv.title.nameAndSurname
            jobAndCompanyLabel.text = cv.title.jobTitle + " " + (cv.experience.first?.company ?? "")
            addressLabel.text = cv.title.address
            emailLabel.text = cv.title.email
            educationLabel.text = (cv.education.first?.university ?? "")
        }
    }
    //MARK: - Views
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        label.textAlignment = .left
        label.text = "User Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobAndCompanyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        label.text = "job position and company name"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        label.text = "City and country"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        label.text = "email@example.com"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let educationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
        label.text = "University name"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - HELPER Methods
    private func setupViews(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        [nameLabel, jobAndCompanyLabel, addressLabel, emailLabel, educationLabel].forEach {  contentView.addSubview($0)
        }
        contentView.backgroundColor = .white
    }
    private func setupConstraints() {
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        updateLabelConstrains()
    }
    
    private func updateLabelConstrains(){
        let halfUserImageDimention: CGFloat = 50
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: halfUserImageDimention + offset).isActive = true // userimage.bottom
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: offset).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        jobAndCompanyLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: offset).isActive = true
        jobAndCompanyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: offset).isActive = true
        jobAndCompanyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        jobAndCompanyLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        addressLabel.topAnchor.constraint(equalTo: jobAndCompanyLabel.bottomAnchor, constant: offset).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: offset).isActive = true
        addressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        educationLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: offset).isActive = true
        educationLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: offset).isActive = true
        educationLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        educationLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: educationLabel.bottomAnchor, constant: offset).isActive = true
        emailLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: offset).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: labelHeight).isActive = true
    } 
}
