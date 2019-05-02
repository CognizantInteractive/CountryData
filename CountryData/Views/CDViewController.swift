//
//  CDViewController.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class CDViewController: UIViewController, NVActivityIndicatorViewable {

    lazy var countryTableView: CDCountryTableView = {
        let countryTableView = CDCountryTableView(frame: self.view.frame, style: UITableView.Style.plain)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        return countryTableView
    }()
    
    var tvViewModel = CDViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(countryTableView)
        countryTableView.layoutSubviews()
        tableViewConstraints()
        self.countryTableView.dataSource = tvViewModel as UITableViewDataSource
        self.countryTableView.delegate = tvViewModel as UITableViewDelegate
        getTableViewList()
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
    
    ///  Get table View list data
    func getTableViewList() {
        let customActivityIndicatorFrame = CGSize(width: 50, height: 50)
        self.startAnimating(customActivityIndicatorFrame, message: AppConstants.CustomActivityIndicatorConstants.activityIndicatorMessage, type: NVActivityIndicatorType.lineScale, color: UIColor.green, backgroundColor: UIColor.white, textColor: UIColor.black)
        getCountryDetails()
    }
    
    /// Get country details
    func getCountryDetails() {
        let dispatchQueue = DispatchQueue(label: AppConstants.customQueueIdentifier, qos: .background)
        dispatchQueue.async {
            self.tvViewModel.getTVList(completionHandler: { (_, _) in
                DispatchQueue.main.async {
                    self.whenParsingIsSuccess()
                    self.stopAnimating(nil)
                }
            }, failureHandler: {(_, errorMessage) in
                DispatchQueue.main.async {
                    self.whenParsingFailure(error: errorMessage)
                }
            })
        }
    }
    
    /// Parsing success
    func whenParsingIsSuccess() {
        self.countryTableView.reloadData()
        self.navigationItem.title = self.tvViewModel.name ?? ""
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            if let tvDataCount = self.tvViewModel.tvData?.count {
                if tvDataCount > 0 {
                    self.countryTableView.beginUpdates()
                    self.countryTableView.reloadRows(at:
                        self.countryTableView.indexPathsForVisibleRows!, with: .none)
                    self.countryTableView.endUpdates()
                }
            }
        }
    }
    
    /// Parsing failure
    ///
    /// - Parameter error: error message
    func whenParsingFailure(error: String) {
        debugPrint("TableView Failure")
        self.stopAnimating(nil)
    }
}
