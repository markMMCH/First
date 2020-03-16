//
//  User.swift
//  first
//
//  Created by Mark Chibukhchian on 3/10/20.
//  Copyright © 2020 Mark Chibukhchian. All rights reserved.
//

import Foundation


struct User: Encodable {
    let password: String
    let phoneNumber: String
}


struct UserDetails: Decodable {
    
    //let message: String
    //let success: Bool
    let data: UserData?
    
}
struct UserData: Decodable {
    //let id: Int
    let fullName: String?
    //let email: String?
    //let companyName: String?
    //let taxNumber: Int?
    let imageUrl: String?
    let phoneNumber: String?
    let dateOfBirth: Double?
    //let balance: Int
    //let userStatusEnumValue: Int
    //let sellerStatusEnumValue: Int
    //let percentToNextLevel: Int
    //let userTypeEnumValue: Int
    //let userAccountTypeEnumValue: Int?
    let userGenderEnumValue: Int?
    //let vehicleTypeEnumValue: String?
    //let vehicleNumber: Int?
    //let enableGlobalNotification: Bool
    //let enableOrderNotification: Bool
    //let passportVerified: Bool
    
}


struct NotificationResponse: Decodable {
    let data: Int
    let message: String
    let success: Bool
}
