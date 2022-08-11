//
//  ModelParser.swift
//  easypeasy
//
//  Created by EXIA on 08/10/2020.
//

import Foundation

class ModelParser {
    
    static func parseStaticDataModel(staticModel:StaticDataModel) -> Void {
        if let profile = ProfileDetails.instance.getProfileDetails() {
            profile.countryCode = staticModel.countryCode
            profile.phoneNo = staticModel.phoneNumber
            profile.firstName = staticModel.firstName
            profile.lastName = staticModel.lastName
            profile.passwordLength = "\(staticModel.passwordLength)"
            profile.email = staticModel.email
            profile.genderId = "\(staticModel.genderID)"
            if let dob = staticModel.dateOfBirth {
                profile.dateOfBirth = dob
            }
            profile.isSubscribed = staticModel.isSubscribed
            profile.cropImageUrl = staticModel.cropImageURL
            profile.cropImageThumbnailUrl = staticModel.cropImageThumbnailURL
            profile.imageUrl = staticModel.imageURL
            profile.imageThumbnailUrl = staticModel.imageThumbnailURL
            profile.paymentMethodCount = "\(staticModel.paymentMethodCount)"
            
            UserDefaults.standard.setValue(staticModel.isGuest, forKey: UserDefaultKeys.isGuestLogin)
            UserDefaults.standard.setValue(staticModel.isGuest ? false : true, forKey: UserDefaultKeys.isUserLogin)
            ProfileDetails.instance.saveProfileDetails(instance: profile)
        }
        SubscriptionInfoStruct.instance.saveData(model: staticModel.subscriptionInfo)
    }
    
    static func parseLoginModel(responseModel:LoginModel) -> Void {
        if let profile = ProfileDetails.instance.getProfileDetails() {
            profile.userID = responseModel.userID ?? ""
            profile.accessToken = responseModel.accessToken
            UserDefaults.standard.setValue(responseModel.isGuest, forKey: UserDefaultKeys.isGuestLogin)
            UserDefaults.standard.setValue(responseModel.isGuest ? false : true, forKey: UserDefaultKeys.isUserLogin)
            ModelParser.contactsSync(responseModel: responseModel)
            ProfileDetails.instance.saveProfileDetails(instance: profile)
        } else {
            let profile = ProfileDetails.instance
            profile.userID = responseModel.userID ?? ""
            profile.accessToken = responseModel.accessToken
            UserDefaults.standard.setValue(responseModel.isGuest, forKey: UserDefaultKeys.isGuestLogin)
            UserDefaults.standard.setValue(responseModel.isGuest ? false : true, forKey: UserDefaultKeys.isUserLogin)
            ModelParser.contactsSync(responseModel: responseModel)
            ProfileDetails.instance.saveProfileDetails(instance: profile)
        }
        
    }
    
    private static func contactsSync(responseModel:LoginModel) {
        if responseModel.isGuest == false {
//            ContactsHelper.instance.syncLocalContacts()
            UserDefaults.standard.setValue((responseModel.syncContactCount == 0) ? false : true, forKey: UserDefaultKeys.isContactsAlreadySync)
        }
    }
    
}

struct SubscriptionInfoStruct {
    static let instance = SubscriptionInfoStruct()
    
    private let defaults = UserDefaults.standard
    
    func saveData(model:SubscriptionModel?) -> Void {
        if model != nil {
            let defaults = UserDefaults.standard
            defaults.set(try? PropertyListEncoder().encode(model), forKey: "SubscriptionInfoStruct")
        }else{
            defaults.set(nil, forKey: "SubscriptionInfoStruct")
        }

    }
    
    func fetchData() -> SubscriptionModel? {
        
        let defaults = UserDefaults.standard
        
        if let data = defaults.object(forKey: "SubscriptionInfoStruct") as? Data{
            if let staticModel = try? PropertyListDecoder().decode(SubscriptionModel.self, from: data) {
                return staticModel
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
}
