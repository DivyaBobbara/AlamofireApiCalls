//
//  ViewModel.swift
//  ProjectAlamofireApiCalls
//
//  Created by Naga Divya Bobbara on 16/08/22.
//

import Foundation
import Alamofire

enum Urls:String{
    case register = "http://stagetao.gcf.education:3000/api/v1/register"
}
class ViewModel {
    static let shared = ViewModel()
    // https://documenter.getpostman.com/view/21317771/UzJJtGy2
    // http://stagetao.gcf.education:3000/
    let networkLayer = NetworkLayer()
    func registerUserApi(userName : String,dob : String,gender : String,email : String,password :String,completion:@escaping(RegisterUserModel?)->Void){
        let params : Parameters = [
            "userName" : userName,
            "dateOfBirth" : dob,
            "gender" : gender,
            "mail" : email,
            "userPassword" : password
        ]
        networkLayer.postMethodApiCalling(url:Urls.register.rawValue , method: "post", params: params) { response in
            completion(response)
        }
    }
    
}
