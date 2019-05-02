//
//  CDCountryTableView.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import UIKit

class CDCountryTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.backgroundColor = ThemingColors.globalWhiteColor()
        self.register(CDTableViewCell.self, forCellReuseIdentifier: AppConstants.CellConstants.cellIdentifier)
        self.separatorStyle = .none
        self.estimatedRowHeight = AppConstants.CellConstants.estimatedHeight
        self.rowHeight = UITableView.automaticDimension
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}
extension CDCountryTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.CellConstants.cellIdentifier, for: indexPath) as?  CDTableViewCell else {
            return UITableViewCell()
        }
        cell.layoutSubviews()
        cell.layoutIfNeeded()
        return cell
    }
}

extension CDCountryTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
