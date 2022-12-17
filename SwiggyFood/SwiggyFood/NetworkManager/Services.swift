//
//  Services.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 16/12/22.
//

import Foundation
import UIKit


private var isTestEnviroment : String = "Test"

private func getBaseURL() -> String {
    
    switch isTestEnviroment {
    case "Test":
        return "https://zig-web.com"
        
    default:
        return "https://zig-web.com"
        
    }
}

struct ServicesEndPoint {
    
    static let checkPlatform = getBaseURL() + "/" + "ZIGSmartIOS"
    static let servicesEndPoint = "/api"
    static let getCategoryEndPointURL = "/Category"
    static let fareEndPoint = "/Fare"
    static let getAllFareforclientEndPoint = "GetAllFareforclient"
    static let getAllCategoryList = checkPlatform + servicesEndPoint + getCategoryEndPointURL + "/" + "GetAllCategory"
    static let getAllProductList = checkPlatform + servicesEndPoint + fareEndPoint + "/" + getAllFareforclientEndPoint

    
    
}
