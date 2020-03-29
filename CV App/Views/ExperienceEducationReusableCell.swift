//
//  ExperienceCell.swift
//  CV App
//
//  Created by Karrar Abd Ali on 27/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class ExperienceEducationReusableCell: UICollectionViewCell {
    
    enum CellType {
        case Experience
        case Education
    }
    
    //MARK: - Variables
    var cv: CV? {
        didSet {
            setupViews()
        }
    }
    
    var cellTypeVariable: CellType? {
        didSet {
            guard let type = cellTypeVariable,
                let cv = cv else { return }
            switch type {
            case .Experience:
                titleLabel.text = "Experience"
                numberOfEntities = cv.experience.count
            case .Education:
                titleLabel.text = "Education"
                numberOfEntities = cv.education.count
            }
        }
    }
    
    lazy var imageDimention: CGFloat = {
        return self.frame.width * 0.2
    }()
    private lazy var entityHeight: CGFloat = {
        return self.frame.width * 0.2
    }()
    private let offset: CGFloat = 5
    
    lazy var numberOfEntities: Int = {
        guard let type = cellTypeVariable,
            let cv = cv else { return 3}
        switch type {
        case .Experience:
            titleLabel.text = "Experience"
            return cv.experience.count
        case .Education:
            titleLabel.text = "Education"
            return cv.education.count
        }
    }()
    //MARK: - Views
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
        label.text = "Title"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - HELPER Methods
    private func setupViews(){
        addSubview(containerView)
        containerView.addSubview(titleLabel)
        
        
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: offset).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: offset * 2).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: offset).isActive = true
        
        var entities: [ExperianceEducationEntityView] = []
        
        for number in 1...numberOfEntities {
            let index = number - 1
            var entity: ExperianceEducationEntityView?
            guard let cv = cv else { return }
            
            switch cellTypeVariable {
            case .Education: entity = ExperianceEducationEntityView(frame: CGRect(x: 0,
                                                                                  y: 0,
                                                                                  width: frame.width,
                                                                                  height: entityHeight),
                                                                    titleText: cv.education[index].university,
                                                                    subtitleText: cv.education[index].degreeTitle,
                                                                    durationText: cv.education[index].startDate + " - " + cv.education[index].endDate )
            case .Experience: entity = ExperianceEducationEntityView(frame: CGRect(x: 0,
                                                                                   y: 0,
                                                                                   width: frame.width,
                                                                                   height: entityHeight),
                                                                     titleText: cv.experience[index].jobTitle,
                                                                     subtitleText: cv.experience[index].company,
                                                                     durationText: cv.experience[index].startDate + " - " + cv.experience[index].endDate )
            case .none:
                print("NOT DEFINED CASE")
            }
            
            if let entity = entity {
                containerView.addSubview(entity)
                entities.append(entity)
            }
        }
        for (index, entity) in entities.enumerated() {
            let topView = ((index == 0) ? titleLabel : entities[index - 1])
            entity.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: offset).isActive = true
            entity.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            entity.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
            entity.heightAnchor.constraint(equalToConstant: entityHeight).isActive = true
        }
    }
}
