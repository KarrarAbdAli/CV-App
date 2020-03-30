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
    weak var headerView: HeaderView?
    var firstCell: TitleFieldCell?
    
    private let educationCellIdentifier = "EducationReusableCell"
    private let experienceCellIdentifier = "ExperienceReusableCell"
    private let emptyCellIdentifier = "emptyCell"
    private let titleFieldCellIdentifier = "TitleFieldCell"
    private let headerViewIdentifier = "headerId"
    private let languaugeCellIdentifier = "LanguageCell"
    private let strengthCellIdentifier = "StrengthsCell"
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
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item {
        case 0: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: titleFieldCellIdentifier , for: indexPath) as? TitleFieldCell {
            firstCell = cell
            cell.cv = cv
            return cell
            }
        case 1: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: experienceCellIdentifier, for: indexPath) as? ExperienceEducationReusableCell {
            cell.cellTypeVariable = .Experience
            cell.cv = cv
            return cell
            }
            
        case 2: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: educationCellIdentifier, for: indexPath) as? ExperienceEducationReusableCell {
            cell.cellTypeVariable = .Education
            cell.cv = cv
            return cell
            }
        case 3: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: languaugeCellIdentifier, for: indexPath) as? LanguagesCell {
            cell.cv = cv
            return cell
            }
        case 4: if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: strengthCellIdentifier, for: indexPath) as? StrengthsCell {
            cell.cv = cv
            return cell
            }
        default:
            return collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellIdentifier, for: indexPath)
        }
        return collectionView.dequeueReusableCell(withReuseIdentifier: emptyCellIdentifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getHeightForItemAt(indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerViewIdentifier, for: indexPath) as? HeaderView
        setupImageConstrains()
        return headerView!
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        
        guard offsetY < 0 else {
            return }
        
        setupImageConstrains()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 1 {
            guard let experiences = cv?.experience else{ return }
            let nc = UINavigationController(rootViewController: ExperienceDetailsTableViewController(experiences: experiences))
            nc.modalPresentationStyle = .fullScreen
            nc.modalTransitionStyle = .crossDissolve
            present(nc, animated:  true)
        }
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
        collectionView.register(StrengthsCell.self, forCellWithReuseIdentifier: strengthCellIdentifier)
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
            userImage.leftAnchor.constraint(equalTo: header.leftAnchor, constant: ViewServices.offset).isActive = true
            userImage.heightAnchor.constraint(equalToConstant: imageDimention).isActive = true
            userImage.widthAnchor.constraint(equalToConstant: imageDimention).isActive = true
        }
    }
    
    private func getHeightForItemAt(indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        switch indexPath.item {
        case 0: let height = CGFloat((5 * ViewServices.labelHeight) + (8 * ViewServices.offset ) + ViewServices.userImageDimention/2)
        return CGSize(width: width, height: height )
        case 1:
            let experienceCount: CGFloat = CGFloat(cv?.experience.count ?? 3)
            let height = CGFloat((experienceCount * 3 * ViewServices.shortLabelHeight) + (15 * ViewServices.offset ) + ViewServices.labelHeight)
            return CGSize(width: width, height: height )
        case 2:
            let eeducationCount: CGFloat = CGFloat(cv?.education.count ?? 3)
            let height = CGFloat((eeducationCount * 3 * ViewServices.shortLabelHeight) + (15 * ViewServices.offset ) + ViewServices.labelHeight)
            return CGSize(width: width, height: height )
        case 3:
            let height = CGFloat((2 * ViewServices.shortLabelHeight) + (2 * ViewServices.labelHeight) + (7 * ViewServices.offset ))
            return CGSize(width: width, height: height)
        case 4: let height: CGFloat =  9 * ViewServices.labelHeight + 9 * ViewServices.offset
        return CGSize(width: width, height: height)
        default:
            return CGSize(width: width, height: 900)
        }
    }
}
