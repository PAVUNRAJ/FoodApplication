//
//  ProductListModel.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 16/12/22.
//

import Foundation


struct ProductParam: Codable {
    let token: String
    let Agencyid: Int
    let Tempfare: Bool
}



// MARK: - Welcome
struct ProductListResponse: Codable {
    let clientID: Int
    let message: String
    let clientName: String
    let clientDesc, clientSubDesc, clientPrimaryColorcode, clientSecondaryaryColorcode: String
    let faremessage, miscfee: String
    let list: [List]
    let farepageTitle: String

    enum CodingKeys: String, CodingKey {
        case clientID = "ClientID"
        case message = "Message"
        case clientName = "ClientName"
        case clientDesc = "ClientDesc"
        case clientSubDesc = "ClientSubDesc"
        case clientPrimaryColorcode = "ClientPrimaryColorcode"
        case clientSecondaryaryColorcode = "ClientSecondaryaryColorcode"
        case faremessage = "Faremessage"
        case miscfee = "Miscfee"
        case list
        case farepageTitle = "FarepageTitle"
    }
}

//enum Name: String, Codable {
//    case cosi = "COSI"
//}

// MARK: - List
struct List: Codable {
    let fareamount, categoryID, fareID: Int
    let zonename: String?
    let routeName: String
    let isactive: Bool
    let validtill: String?
    let createddate: String?
    let createdby: String?
    let agencyID: Int
    let serverdate: String?
    let type: String?
    let agencyname: String?
    let category: String
    let zoneID: Int
    let message: String?
    let farename: String
    let maxCount: Int
    let productDescription, productMiscDescription: String
    let verificationStatus, paymentMode: Int
    let productName: String
    let productCost, productVegCategory: Int
    let productImageURL: String

    enum CodingKeys: String, CodingKey {
        case fareamount = "Fareamount"
        case categoryID = "CategoryId"
        case fareID = "FareId"
        case zonename = "Zonename"
        case routeName = "RouteName"
        case isactive = "Isactive"
        case validtill = "Validtill"
        case createddate = "Createddate"
        case createdby = "Createdby"
        case agencyID = "AgencyId"
        case serverdate = "Serverdate"
        case type = "Type"
        case agencyname = "Agencyname"
        case category = "Category"
        case zoneID = "ZoneId"
        case message = "Message"
        case farename = "Farename"
        case maxCount = "MaxCount"
        case productDescription = "ProductDescription"
        case productMiscDescription = "ProductMiscDescription"
        case verificationStatus = "VerificationStatus"
        case paymentMode = "PaymentMode"
        case productName = "ProductName"
        case productCost = "ProductCost"
        case productVegCategory = "ProductVegCategory"
        case productImageURL = "ProductImageURL"
    }
}


