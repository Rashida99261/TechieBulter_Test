//
//  ApiClient.swift
//  TechiebutlerTest
//
//  Created by Rashida on 1/05/24.
//

import Foundation
import Alamofire

class APIClient {
    

    
    static func callGetapi(url:String, completion: @escaping (Any, Int?)->Void){
        let request = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: APIManager.headers(), interceptor: nil)

        request.responseJSON { response in
            
            let status = response.response?.statusCode ?? 0
            switch response.result {
            case .success(let val):
                if let castingValue = val as? [[String: Any]] {
                    print(castingValue)
                    completion(castingValue,status)
                }
            case .failure(_):
                let obj = [String: Any]()
                completion(obj,status)
            }
        }
    }
}


class APIManager {

    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
        return headers
    }
}

