//
//  AdherenceProtocol.swift
//  CountryData
//
//  Created by Mohammad Jahid on 02/05/19.
//  Copyright © 2019 cognizant. All rights reserved.
//  Description - Cell configurable protocol.

import Foundation
import UIKit

/// TableView Cell Configureable protocol
public protocol UITableViewCellConfigurable where Self: UITableViewCell {
    associatedtype ModelType
    /// Configure tableview cell
    ///
    /// - Parameter model: model array
    func configureCell(model: ModelType)
}
