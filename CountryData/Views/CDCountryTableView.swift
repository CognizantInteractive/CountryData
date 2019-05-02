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
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
    }
}
