//
//  StrengthsCell.swift
//  CV App
//
//  Created by Karrar Abd Ali on 29/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class StrengthsCell: UICollectionViewCell {
    //MARK: - Var
    var cv: CV? {
        didSet {
            setupViews()
        }
    }
    //MARK: - Views
    lazy var cellTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .left
        label.text = "Skills & Strengths"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 50, width: contentView.frame.width, height: 100)
        button.setTitle("See all", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.setTitleColor(.lightBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Methods
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(cellTitleLabel)
        cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ViewServices.doubleOffset ).isActive = true
        cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: ViewServices.doubleOffset).isActive = true
        cellTitleLabel.heightAnchor.constraint(equalToConstant: ViewServices.labelHeight * 2).isActive = true
        
        guard cv != nil else {return}
        
        let views = makeLabels()
        
        for (index, item) in views.enumerated(){
            guard index <= 2 else { return }
            contentView.addSubview(item)
            let topView = ((index == 0) ? cellTitleLabel : views[index - 1])
            item.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
            item.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: ViewServices.offset).isActive = true
            item.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
            item.heightAnchor.constraint(equalToConstant: ViewServices.labelHeight * 2).isActive = true
            
            if index == 2, views.count > 3 {
                contentView.addSubview(button)
                let currentView = views[index]
                button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
                button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
                button.topAnchor.constraint(equalTo: currentView.bottomAnchor, constant: ViewServices.offset).isActive = true
                button.heightAnchor.constraint(equalToConstant: ViewServices.labelHeight * 2).isActive = true
            }
        }
    }
    
    func makeLabels() -> [UILabel] {
        var labels: [UILabel] = []
        guard let cv = cv else { return [] }
        cv.strength.cvItemTag.forEach { labels.append(self.makeLabel(withTitle: $0)) }
        return labels
    }
    
    func makeLabel(withTitle title: String) -> UILabel {
        let label: UILabel = {
            let label = UILabel()
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
            label.textAlignment = .left
            label.text = "   \(title)"
            label.layer.borderWidth = ViewServices.lineViewWidth
            label.layer.borderColor = UIColor.backgroundColor.cgColor
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        return label
    }
}
