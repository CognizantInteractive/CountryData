//
//  CDModel.swift
//  CountryData
//
//  Created by Mohammad Jahid on 30/04/19.
//  Copyright © 2019 cognizant. All rights reserved.
//

import Foundation

struct TLResponseModel: Codable {
    let ttitle: String?
    let rows: [RowsModel]?
    enum CodingKeys: String, CodingKey {
        case ttitle = "title"
        case rows = "rows"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ttitle = try values.decodeIfPresent(String.self, forKey: .ttitle)
        rows = try values.decodeIfPresent([RowsModel].self, forKey: .rows)
    }
}

struct RowsModel: Codable {
    let rtitle: String?
    let rdescription: String?
    let rimageHref: String?
    enum CodingKeys: String, CodingKey {
        case rtitle = "title"
        case rdescription = "description"
        case rimageHref = "imageHref"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rtitle = try values.decodeIfPresent(String.self, forKey: .rtitle)
        rdescription = try values.decodeIfPresent(String.self, forKey: .rdescription)
        rimageHref = try values.decodeIfPresent(String.self, forKey: .rimageHref)
    }
}
