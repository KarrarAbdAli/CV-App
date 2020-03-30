//
//  ExperienceDetailsTableViewController.swift
//  CV App
//
//  Created by Karrar Abd Ali on 30/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import UIKit

class ExperienceDetailsTableViewController: UITableViewController {
   //MARK: - var
    var experiences: [Experience] = []
  let experienceReuseIdentifier = "ExperienceDetailsCell"
    
    //MARK: Views
    
    lazy var titleLabel: UILabel =  {
      let label = UILabel()
        return label
    }()
    
    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupViews()
    }
    
    convenience init(experiences: [Experience]) {
        self.init()
        self.experiences = experiences
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return experiences.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: experienceReuseIdentifier) as? ExperienceDetailsCell
        cell = ExperienceDetailsCell(experience: self.experiences[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let numberofItems = CGFloat(experiences[indexPath.row].items.count)
        return (numberofItems + (4 * ViewServices.labelHeight)) * ViewServices.doubleOffset
    }
    
    private func setupTableView() {
        tableView.register(ExperienceDetailsCell.self, forCellReuseIdentifier: experienceReuseIdentifier)
        tableView.allowsSelection = false
    }
    private func setupViews(){
        self.navigationItem.title = "Experiences"
        let barButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(dismissController))
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc private func dismissController() {
        self.dismiss(animated: true, completion: nil)
    }
}
