//
//  CategoryList.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 16/12/22.
//

import Foundation
import UIKit


struct TokenParam: Codable {
    let token: String
}

struct CategoryListResponse: Codable {
    let model: [Model]
    let message: String

    enum CodingKeys: String, CodingKey {
        case model = "Model"
        case message = "Message"
    }
}

// MARK: - Model
struct Model: Codable {
    let categoryname, agencyname, createdate, createby: String
    let lastUpdateddate: String
    let lastUpdatedby: String?
    let agencyID: Int
    let isactive: Bool
    let categortID: Int
    let fare: String?

    enum CodingKeys: String, CodingKey {
        case categoryname = "Categoryname"
        case agencyname = "Agencyname"
        case createdate = "Createdate"
        case createby = "Createby"
        case lastUpdateddate = "LastUpdateddate"
        case lastUpdatedby = "LastUpdatedby"
        case agencyID = "AgencyId"
        case isactive = "Isactive"
        case categortID = "CategortId"
        case fare = "Fare"
    }
}
