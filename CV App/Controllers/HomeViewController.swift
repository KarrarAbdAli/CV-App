//
//  HomeViewController.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class HomeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    // MARK: -Variables
    let service = NetworkServices()
    var cv: CV?
    var headerView: HeaderView?
    var firstCell: TitleFieldCell?
    
    private let educationCellIdentifier = "EducationReusableCell"
    private let experienceCellIdentifier = "ExperienceReusableCell"
    private let emptyCellIdentifier = "emptyCell"
    private let titleFieldCellIdentifier = "TitleFieldCell"
    private let headerViewIdentifier = "headerId"
    private let languaugeCellIdentifier = "LanguageCell"
    //MARK:- VIEWS
    
    lazy var userImage: UIImageView = {
        let imageView = UIImageView()
        if let image = UIImage(named: "karrar") {
            imageView.image = image
        }
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.lightText.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchingData()
        setUpViews()
    }
    
    // MARK: - CollectionView delegate and DataSource Methods
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleFieldCellIdentifier , for: indexPath) as? TitleFieldCell {
            firstCell = cell
            cell.cv = cv
            return cell
            }
        case 1: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: experienceCellIdentifier, for: indexPath) as? ExperienceEducationReusableCell {
            cell.cv = cv
            cell.cellTypeVariable = .Experience
            return cell
            }
            
        case 2: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: educationCellIdentifier, for: indexPath) as? ExperienceEducationReusableCell {
            cell.cv = cv
            cell.cellTypeVariable = .Education
            return cell
            }
        case 3: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: languaugeCellIdentifier, for: indexPath) as? LanguagesCell {
            cell.cv = cv
            return cell
            }
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellIdentifier, for: indexPath)
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellIdentifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let multiplier = cv?.experience.count {
            switch indexPath.item {
            case 0:
            return CGSize(width: view.frame.width , height: 160)
            case 1...2: return CGSize(width: view.frame.width , height: CGFloat((Int(view.frame.height)/multiplier) + 10 * multiplier))
            case 3: return CGSize(width: view.frame.width , height:90)
            default: return CGSize(width: view.frame.width , height: CGFloat((Int(view.frame.height)/multiplier) + 10 * multiplier))
            }
        }
        return CGSize(width: view.frame.width , height: view.frame.height * 0.3)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath) as? HeaderView
        setupImageConstrains()
        return headerView!
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        setupImageConstrains()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    // MARK:- Private Helper Methods
    private func setUpViews(){
        navigationItem.title = "Home"
        collectionView.backgroundColor = .clear
        view.backgroundColor = .backgroundColor
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: emptyCellIdentifier)
        collectionView.register(TitleFieldCell.self, forCellWithReuseIdentifier: titleFieldCellIdentifier)
        collectionView.register(ExperienceEducationReusableCell.self, forCellWithReuseIdentifier: experienceCellIdentifier)
        collectionView.register(ExperienceEducationReusableCell.self, forCellWithReuseIdentifier: educationCellIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerViewIdentifier)
        collectionView.register(LanguagesCell.self, forCellWithReuseIdentifier: languaugeCellIdentifier)
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    
    //MARK:- Helper methods
    private func fetchingData(){
        service.fetchCVJsonData { (result) in
            switch result{
            case .success(let cv): self.cv = cv
            self.collectionView.reloadData()
            case .failure(let error): self.dataFetchingErrorHundler(error: error)
            }
        }
    }
    
    private func dataFetchingErrorHundler(error: Error){
        let alert = UIAlertController(title: "Error", message: "An Error: \(error.localizedDescription) happend during detching data", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Retry Fetching Data", style: .default, handler: { _ in
            self.fetchingData()
        }))
    }
    
    private func setupImageConstrains(){
        let imageDimention: CGFloat = 100
        if let header = headerView {
            collectionView.addSubview(userImage)
            userImage.bottomAnchor.constraint(equalTo: header.bottomAnchor, constant: imageDimention/2).isActive = true
            userImage.leftAnchor.constraint(equalTo: header.leftAnchor, constant: header.offset).isActive = true
            userImage.heightAnchor.constraint(equalToConstant: imageDimention).isActive = true
            userImage.widthAnchor.constraint(equalToConstant: imageDimention).isActive = true
        }
    }
}
