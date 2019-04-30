//
//  CDViewController.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit

class CDViewController: UIViewController {

    lazy var countryTableView: CDCountryTableView = {
        let countryTableView = CDCountryTableView(frame: self.view.frame, style: UITableView.Style.plain)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        return countryTableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(countryTableView)
        countryTableView.layoutSubviews()
        tableViewConstraints()
    }

    /// SafeArea Layout for TableView
    func tableViewConstraints() {
        NSLayoutConstraint.activate([
            countryTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            countryTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            countryTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            countryTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
}
