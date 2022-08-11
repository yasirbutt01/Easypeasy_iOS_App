//
//  SyncUserContactsModels.swift
//  easypeasy
//
//  Created by Ahmad on 05/10/2020.
//

import Foundation

struct SyncUserContactsModel: Codable {
    var contacts: [UserContactModel]
}

// MARK: - Contact
struct UserContactModel: Codable, Hashable {
    static func == (lhs: UserContactModel, rhs: UserContactModel) -> Bool {
        return lhs.phoneNumber == rhs.phoneNumber
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(phoneNumber)
    }
    
    var requestTypeID: Int?
    var id: String?
    var userID: String?
    var contactUserID: String?
    var firstName: String
    var lastName, company, countryCode, phoneNumber: String
    var isInApp: Bool
    var email, address, web, socialLink: [ContactInfoModel]?
    var date: [ContactInfoModel]?

    enum CodingKeys: String, CodingKey {
        case requestTypeID = "requestTypeId"
        case id
        case userID = "userId"
        case contactUserID = "contactUserId"
        case firstName, lastName, company, countryCode, phoneNumber, isInApp, email, address, web, socialLink, date
    }
}

// MARK: - Address
struct ContactInfoModel: Codable, Equatable {
    let text: String?
    let tag: String?
    let date: String?
    
    static func == (lhs: ContactInfoModel, rhs: ContactInfoModel) -> Bool {
        let text1 = lhs.text?.lowercased() ?? ""
        let text2 = rhs.text?.lowercased() ?? ""
        
        let tag1 = lhs.tag?.lowercased() ?? ""
        let tag2 = rhs.tag?.lowercased() ?? ""
        
        let date1 = lhs.date?.lowercased() ?? ""
        let date2 = rhs.date?.lowercased() ?? ""
        
        return (text1 == text2 &&
                tag1 == tag2 &&
                date1 == date2)
    }
    
}




struct ContactInfoStruct {
    static let instance = ContactInfoStruct()
    
    private let defaults = UserDefaults.standard
    
    func saveData(model:SyncUserContactsModel?) -> Void {
        if model != nil {
            let defaults = UserDefaults.standard
            defaults.set(try? PropertyListEncoder().encode(model), forKey: "ContactInfoStruct")
        }else{
            defaults.set(nil, forKey: "ContactInfoStruct")
        }

    }
    
    func fetchData() -> SyncUserContactsModel? {
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "ContactInfoStruct") as? Data{
            if let contactModel = try? PropertyListDecoder().decode(SyncUserContactsModel.self, from: data) {
                return contactModel
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}


struct SyncUserResponseModel: Codable {
    let isError: Bool
    let messages: String
    let data: SyncUserContactsModel
}
