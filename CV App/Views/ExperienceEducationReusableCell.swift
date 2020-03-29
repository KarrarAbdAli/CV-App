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
            guard let type = cellTypeVariable else { return }
            switch type {
            case .Experience:
                titleLabel.text = "Experience"
            case .Education:
                titleLabel.text = "Education"
            }
            
            setupViews()
        }
    }
    
    var cellTypeVariable: CellType?
    private var isViewsAdded = false
    
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
        
        titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: ViewServices.offset).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: ViewServices.doubleOffset).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: ViewServices.offset).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: ViewServices.labelHeight).isActive = true
        var entities: [ExperianceEducationEntityView] = []
        
        guard let cv = cv else {return}
        
        let numberOfEntities = (cellTypeVariable == .Experience) ? cv.experience.count : cv.education.count
        
        let entityHeight: CGFloat = ((contentView.frame.height - ViewServices.shortLabelHeight) - (CGFloat(numberOfEntities) * ViewServices.offset))/CGFloat(numberOfEntities)
        
        for number in 1...numberOfEntities {
            let index = number - 1
            var entity: ExperianceEducationEntityView?
            
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
            
            if !isViewsAdded ,
                let entity = entity {
                containerView.addSubview(entity)
                entities.append(entity)
            }
        }
        for (index, entity) in entities.enumerated() {
            let topView = ((index == 0) ? titleLabel : entities[index - 1])
            entity.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
            entity.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
            entity.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            entity.heightAnchor.constraint(equalToConstant: entityHeight).isActive = true
        }
        isViewsAdded = true
    }
}
