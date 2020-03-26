//
//  ViewController.swift
//  CV App
//
//  Created by Karrar Abd Ali on 25/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let service = NetworkServices()
    var cv: CV?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      fetchingData()
    }
    
    private func fetchingData(){
        service.fetchCVJsonData { (result) in
            switch result{
            case .success(let cv): self.cv = cv
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
}
