//
//  HeaderView.swift
//  CV App
//
//  Created by Karrar Abd Ali on 28/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class HeaderView: UICollectionReusableView {
    //MARK: - Var and Views
    
    let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "sunset")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper methods
    private func setupViews(){
        addSubview(thumbnailImageView)
        thumbnailImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        thumbnailImageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        thumbnailImageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
}
