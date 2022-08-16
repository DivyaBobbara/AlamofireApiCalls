//
//  Model.swift
//  ProjectAlamofireApiCalls
//
//  Created by Naga Divya Bobbara on 16/08/22.
//

import Foundation
struct RegisterUserModel:Codable{
    let status,message : String?
    let data : RegisterUserModelData?
    let errorCode : Int?
}
struct RegisterUserModelData:Codable{
    let userName, gender, dateOfBirth, mail: String?
}
