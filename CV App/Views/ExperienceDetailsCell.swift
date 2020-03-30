//
//  ExperienceDetailsCell.swift
//  CV App
//
//  Created by Karrar Abd Ali on 30/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class ExperienceDetailsCell: UITableViewCell {
    //MARK: - var
    var experience: Experience!
    var labels: [UILabel] = []
    
    
    //MARK: -  Views
    
    lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo\(Int.random(in: 0...2))")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    //MARK: - init
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    convenience init(experience: Experience) {
        self.init()
        self.experience = experience
        setup()
    }
 
    //MARK: - private methods
    private func setup() {
        setupImageLogo()
        setupExperienceTitleLabel()
        setupExperienceDetailsPointsLabel()
    }
    private func setupImageLogo() {
        addSubview(logoImageView)
        
        logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: ViewServices.doubleOffset * 3.3).isActive = true
        logoImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: ViewServices.doubleOffset).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: ViewServices.logoImageDimention.height).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: ViewServices.logoImageDimention.width).isActive = true
    }
    private func setupExperienceTitleLabel() {
        
        let text = " \n \(experience.jobTitle) \n \(experience.company) \n \(experience.startDate) - \(experience.endDate) \n \(experience.city) \(experience.country)\n"
        
        let label = makeLabel(withText: text)
        addSubview(label)
        labels.append(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: ViewServices.doubleOffset).isActive = true
        label.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: ViewServices.doubleOffset).isActive = true
        label.heightAnchor.constraint(equalToConstant: ViewServices.labelHeight * 5 + 5 * ViewServices.doubleOffset).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func setupExperienceDetailsPointsLabel(){
        var text = ""
        var counter = 0
        experience.items.forEach { (item) in
            counter += 1
            text += " \n \(counter).\(item) \n "
        }
        
        let label = makeLabel(withText: text)
        addSubview(label)
        labels.append(label)
        label.topAnchor.constraint(equalTo: labels.first!.bottomAnchor, constant: ViewServices.offset).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor, constant: ViewServices.doubleOffset).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .left
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
