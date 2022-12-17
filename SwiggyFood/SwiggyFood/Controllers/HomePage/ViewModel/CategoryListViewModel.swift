//
//  CategoryListViewModel.swift
//  SwiggyFood
//
//  Created by PavunRaj-OBS-36 on 16/12/22.
//

import Foundation
import Alamofire

class CategoryListViewModel {
    typealias Result<T: Codable> = Swift.Result<T, ServiceManger.Error>
    typealias Completion<T: Codable> = (Result<T>) -> Void
    static func categoryListAPIRequest(with param: TokenParam, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<CategoryListResponse>) {
        print("Url is : ",ServicesEndPoint.getAllCategoryList)
        ServiceManger.postJSONRequest(ServicesEndPoint.getAllCategoryList, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .get, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
            completion(responseData)
        }
    }
    
    
    
    static func ProductListAPIRequest(with param: ProductParam, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<ProductListResponse>) {
        print("Url getAllProductList is : ",ServicesEndPoint.getAllProductList)
        ServiceManger.postJSONRequest(ServicesEndPoint.getAllProductList, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: true,methodType: .get, jsonType: URLEncodedFormParameterEncoder.default) { responseData in
            completion(responseData)
        }
    }
    
//    static func signUpSocialAPIRequest(with param: SignupSocialParam, controller : UIViewController, boolLoaderEnable : Bool, completion: @escaping Completion<SocialSignupResponseDetails>) {
//        ServiceManger.postJSONRequest(ServerAPIURL.signup_social_api, parameters: param, controller: controller, boolLoaderEnable: boolLoaderEnable, headerEnable: false,methodType: .post, jsonType: JSONParameterEncoder.default) { responseData in
//            completion(responseData)
//        }
//    }
}

