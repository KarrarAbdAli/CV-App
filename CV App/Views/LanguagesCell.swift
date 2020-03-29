//
//  LanguagesCell.swift
//  CV App
//
//  Created by Karrar Abd Ali on 29/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class LanguagesCell: UICollectionViewCell {
    //MARK: - Var
    var offset: CGFloat = 5
     var cv: CV? {
        didSet {
            guard let cv = cv else {return}
            numberOfLanguagesLabel.text = "\(cv.Language.count)"
            motherLanguageLabel.text = cv.Language.filter {$0.isNative == true}.first?.name ?? " "
        }
    }
    //MARK: - Views
    lazy var cellTitleLabel: UILabel = {
           let label = UILabel()
           label.font = UIFont.preferredFont(forTextStyle: .body)
           label.textAlignment = .left
           label.text = "Accomplishments"
           label.textColor = .black
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    
    lazy var numberOfLanguagesLabel: UILabel = {
           let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
           label.textAlignment = .center
           label.text = "1"
           label.textColor = .lightBlue
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
    lazy var languagesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "Languages"
        label.textColor = .lightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var motherLanguageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        label.textAlignment = .left
        label.text = "Mother language"
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nativeLanguageStatementLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textAlignment = .left
        label.text = "Native or bilangual proficiency"
        label.textColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
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
    
    //MARK: - Helper Methods
    private func setupViews() {
        contentView.backgroundColor = .white
        contentView.addSubview(cellTitleLabel)
        contentView.addSubview(numberOfLanguagesLabel)
        contentView.addSubview(lineView)
        contentView.addSubview(motherLanguageLabel)
        contentView.addSubview(languagesTitleLabel)
        contentView.addSubview(nativeLanguageStatementLabel)
        
        cellTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: offset).isActive = true
        cellTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: offset).isActive = true
        cellTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        numberOfLanguagesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: offset * 4 ).isActive = true
        numberOfLanguagesLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor).isActive = true
        numberOfLanguagesLabel.heightAnchor.constraint(equalToConstant: 65).isActive = true
        numberOfLanguagesLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true

        
        languagesTitleLabel.leftAnchor.constraint(equalTo: numberOfLanguagesLabel.rightAnchor).isActive = true
        languagesTitleLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        languagesTitleLabel.topAnchor.constraint(equalTo: cellTitleLabel.bottomAnchor, constant: 2 * offset).isActive = true
        languagesTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        motherLanguageLabel.leadingAnchor.constraint(equalTo: languagesTitleLabel.leadingAnchor).isActive = true
        motherLanguageLabel.trailingAnchor.constraint(equalTo: languagesTitleLabel.trailingAnchor).isActive = true
        motherLanguageLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        motherLanguageLabel.topAnchor.constraint(equalTo: languagesTitleLabel.bottomAnchor, constant: offset).isActive = true
        
        nativeLanguageStatementLabel.leadingAnchor.constraint(equalTo: motherLanguageLabel.leadingAnchor).isActive = true
        nativeLanguageStatementLabel.trailingAnchor.constraint(equalTo: motherLanguageLabel.trailingAnchor).isActive = true
        nativeLanguageStatementLabel.topAnchor.constraint(equalTo: motherLanguageLabel.bottomAnchor, constant: offset/2).isActive = true
        nativeLanguageStatementLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
}
