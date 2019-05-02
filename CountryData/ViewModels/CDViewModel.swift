//
//  CDViewModel.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit

class CDViewModel: NSObject {
    var tvData: [RowsModel]?
    var name: String?
    let tvDataReceiver = WebServiceManager() as DataReceiver
    
    /// Function for Getting data
    ///
    /// - Parameters:
    ///   - completionHandler: On Sucess
    ///   - failureHandler: On Failure
    func getTVList(completionHandler: @escaping SuccessClosure, failureHandler: @escaping FailureClosure) {
        
                tvDataReceiver.fetchCountryDataList(completionHandler: { [weak self] (_, data) in
                    if let modelObject = try? JSONDecoder().decode(TLResponseModel.self, from: data!) {
                        let parsedArray = modelObject.rows
                        // Filtered data which has all values nil
                        let filteredArray = parsedArray?.filter {(($0.rdescription != nil) || ($0.rtitle != nil) || ($0.rimageHref != nil))}
                        self?.tvData = filteredArray
                        self?.name = modelObject.ttitle
                        completionHandler(true, AppConstants.ClosureConstants.successDecodeMessage)
                    } else {
                        failureHandler(false, AppConstants.ClosureConstants.unsuccessDecodeMessage)
                    }
                    }, failureHandler: { (_, _) in
                        failureHandler(false, AppConstants.ClosureConstants.errorDataReceived)
                })
            }
}

extension CDViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tvData?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellConstants.cellIdentifier, for: indexPath) as?  CDTableViewCell else {
            return UITableViewCell()
        }
        cell.indexPath = indexPath
        if let modelData = self.tvData?[indexPath.row] {
            cell.configureCell(model: modelData)
        }
        cell.layoutSubviews()
        cell.layoutIfNeeded()
        return cell
    }
}

extension CDViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
