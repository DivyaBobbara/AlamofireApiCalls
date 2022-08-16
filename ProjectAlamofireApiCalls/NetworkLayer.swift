//
//  NetworkLayer.swift
//  ProjectAlamofireApiCalls
//
//  Created by Naga Divya Bobbara on 16/08/22.
//

import Foundation
import Alamofire
class NetworkLayer{

    func postMethodApiCalling(url : String , method : String, params : Parameters,completion:@escaping(RegisterUserModel?)->Void){
        
        AF.request(url, method: HTTPMethod(rawValue: method), parameters: params, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200..<229).responseDecodable (of: RegisterUserModel.self){ response in
            completion(response.value)
        }
        
    }
    
}
