//
//  CDViewController.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit
import Reachability
import NVActivityIndicatorView

class CDViewController: UIViewController, NVActivityIndicatorViewable {
    
    lazy var countryTableView: CDCountryTableView = {
        let countryTableView = CDCountryTableView(frame: self.view.frame, style: UITableView.Style.plain)
        countryTableView.translatesAutoresizingMaskIntoConstraints = false
        return countryTableView
    }()
    
    var tvViewModel = CDViewModel()
    var reachability: Reachability?
    let networkON = Notification.Name(rawValue: AppConstants.RecabilityConstants.networkOnNotificationKey)
    let networkOFF = Notification.Name(rawValue: AppConstants.RecabilityConstants.networkOffNotificationKey)
    
    var isReachable: Bool = true
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: .valueChanged)
        return refreshControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.reachability = Reachability.init()
        self.view.addSubview(countryTableView)
        self.countryTableView.dataSource = tvViewModel as UITableViewDataSource
        self.countryTableView.delegate = tvViewModel as UITableViewDelegate
        countryTableView.layoutSubviews()
        tableViewConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if #available(iOS 10.0, *) {
            countryTableView.refreshControl = refresher
        } else {
            countryTableView.addSubview(refresher)
        }
        createNotificationObservers()
    }
    
    /// Notification Observers
    func createNotificationObservers() {
        // Network ON
        NotificationCenter.default.addObserver(self, selector: #selector(CDViewController.actOnNetworkON(notification:)), name: networkON, object: nil)
        // Network OFF
        NotificationCenter.default.addObserver(self, selector: #selector(CDViewController.actOnNetworkOFF(notification:)), name: networkOFF, object: nil)
    }
    
    @objc func actOnNetworkON(notification: NSNotification) {
        self.isReachable = true
        debugPrint("CHECKING REACHABILITY NOTIFICATION FROM OFF to ON")
        getTableViewList()
    }
    
    @objc func actOnNetworkOFF(notification: NSNotification) {
        self.isReachable = false
        debugPrint("CHECKING REACHABILITY NOTIFICATION FROM ON to OFF")
        DispatchQueue.main.async {
            self.stopAnimating(nil)
            self.countryTableView.refreshControl?.endRefreshing()
            self.showAlertWith(title: AppConstants.AlertConstants.alertHeader, message: AppConstants.AlertConstants.alertOffLineMessage)
        }
    }
    
    /// Refresh Controller Actions
    ///
    /// - Parameter sender: refresher
    @objc func refreshControlAction(_ sender: Any) {
        //Call the service here
        fetchDataUsingViewModel(completionHandler: { (_, message) in
            debugPrint("table view \(message)")
        }, failureHandler: { (_, message) in
            debugPrint("table view \(message)")
        })
        self.countryTableView.refreshControl?.endRefreshing()
        refresher.endRefreshing()
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
    
    /// Call ViewModel to fetch Data
    func fetchDataUsingViewModel(completionHandler: @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        debugPrint("IS REACHABLE:......>", isReachable as Any)
        if self.isReachable == true {
            getTableViewDataWhenRefreshed(completionHandler: { (status, message) in
                debugPrint("table view \(message)")
                completionHandler(status, message)
            }, failureHandler: { (status, message) in
                debugPrint("table view \(message)")
                failureHandler(status, message)
            })
        } else {
            self.countryTableView.refreshControl?.endRefreshing()
            failureHandler(false, AppConstants.AlertConstants.alertOffLineMessage)
        }
    }
    
    ///  Get table View list data
    func getTableViewList() {
        let customActivityIndicatorFrame = CGSize(width: 50, height: 50)
        self.startAnimating(customActivityIndicatorFrame, message: AppConstants.CustomActivityIndicatorConstants.activityIndicatorMessage, type: NVActivityIndicatorType.lineScale, color: UIColor.green, backgroundColor: UIColor.white, textColor: UIColor.black)
        getCountryDetails()
    }
    
    /// Get country details
    func getCountryDetails() {
        if let bytesMB = CalculateDeviceFreeSpace.deviceRemainingFreeSpaceInMegaBytes() {
            debugPrint("free space: \(bytesMB)")
            if bytesMB >= AppConstants.minimumFreeSpace {
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
            } else {
                debugPrint(AppConstants.DeviceSpaceConstants.alertToFreeSpace)
            }
        } else {
            debugPrint(AppConstants.DeviceSpaceConstants.deviceSpaceFailure)
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
        self.showAlertWith(title: AppConstants.AlertConstants.alertHeader, message: error)
    }
    
    /// Get tableView Data refreshed
    func getTableViewDataWhenRefreshed(completionHandler: @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        let dispatchQueue = DispatchQueue(label: AppConstants.customQueueIdentifier, qos: .background)
        dispatchQueue.async {
            self.tvViewModel.getTVList(completionHandler: { (_, _) in
                DispatchQueue.main.async {
                    self.whenParsingIsSuccess()
                    completionHandler(true, AppConstants.AlertConstants.alertRefreshSuccess)
                }
            }, failureHandler: {(_, errorMessage) in
                DispatchQueue.main.async {
                    self.whenParsingFailure(error: errorMessage)
                }
                failureHandler(false, AppConstants.AlertConstants.alertRefreshFailure)
            })
        }
        
    }
    
    /// Display Alert
    ///
    /// - Parameters:
    ///   - title: Alert Title
    ///   - message: Alert Message
    func showAlertWith(title: String, message: String) {
        let alertVc = UIAlertController.showAlertWith(title: title, message: message)
        self.present(alertVc, animated: true, completion: nil)
    }
}
