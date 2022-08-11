//
//  String+Extension.swift
//  easypeasy
//
//  Created by Ahmad on 05/10/2020.
//

import Foundation

extension String {
    func getMSISDNFromString() -> String? {
        let okayChars : Set<Character> = Set("1234567890+")
        
        var result = self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.regularExpression, range:nil).trimmingCharacters(in: CharacterSet.whitespaces)
        
        result = String(result.filter {okayChars.contains($0) })
        if result.hasPrefix("+") {
            return result
        }
        
        var msisdn = result
        if result.hasPrefix("00"){
            msisdn.removeFirst()
            msisdn.removeFirst()
        }else if result.hasPrefix("0"){
            msisdn.removeFirst()
        }
        
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            print(countryCode)
            let callingCode = IsoCountryCodes.find(key: countryCode).calling
            print(callingCode)
            msisdn = callingCode+msisdn
        }
        
        return msisdn
    }
    
    func getMSISDNFromString2() -> (countryCode: String?, phoneNumber:String?) {
        let okayChars : Set<Character> = Set("1234567890+")
        
        var result = self.replacingOccurrences(of: " ", with: "", options: NSString.CompareOptions.regularExpression, range:nil).trimmingCharacters(in: CharacterSet.whitespaces)
        
        result = String(result.filter {okayChars.contains($0) })
        if result.hasPrefix("+") {
            if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
                let callingCode = IsoCountryCodes.find(key: countryCode).calling
//                let codeStr = "\(callingCode)"
//                for (_, _) in codeStr.enumerated() {
//                    result.removeFirst()
//                }
                return (callingCode, result)
            }
        }
        
        let countryCode = getCountryCode()
        var msisdn = result
        if result.hasPrefix("00"){
            msisdn.removeFirst()
            msisdn.removeFirst()
            msisdn = "+" + msisdn
        } else if result.hasPrefix("0"){
            msisdn.removeFirst()
            msisdn = countryCode + msisdn
        } else {
            msisdn = countryCode + msisdn
        }
        
        msisdn = msisdn.trimmingCharacters(in: .whitespacesAndNewlines)
        msisdn = msisdn.replacingOccurrences(of: "-", with: "")
        
//        var callingCode = ""
//        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
//            callingCode = IsoCountryCodes.find(key: countryCode).calling
//            msisdn = callingCode+msisdn
//            msisdn = msisdn.trimmingCharacters(in: .whitespacesAndNewlines)
//            msisdn = msisdn.replacingOccurrences(of: "-", with: "")
//        }
        
        return (countryCode, msisdn)
    }
    
    private func getCountryCode() -> String {
        var callingCode = ""
        if let countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String {
            callingCode = IsoCountryCodes.find(key: countryCode).calling
        }
        return callingCode
    }
    
    func getStringFromDateString() -> String{
        
//        let dateString = "\(self) 04:01:32.0"
        let dateString = "\(self) 00:00:00.0"

        let dateFormatter12 = DateFormatter()
        dateFormatter12.dateFormat = "yyyy/MM/dd HH:mm:ss.S"
        let dateFromString = dateFormatter12.date(from: dateString)

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MMMM d, yyyy"

        let stringFromDate = dateFormatter2.string(from: dateFromString!)
        return stringFromDate
        
    }
    
    func getLocalDate() -> Date{
        let startIndex = self.index(self.startIndex, offsetBy: 0)
        let endIndex = self.index(self.startIndex, offsetBy: 18)
        let substring = self[startIndex...endIndex]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        
        let convertedlocalTime = String(substring).UTCToLocal()
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let localDate = dateFormatter.date(from: convertedlocalTime)
        
        return localDate!
    }
    
    func localToUTC() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.calendar = NSCalendar.current
        dateFormatter.locale = DateFormats.EN_US_POSIX
        
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let utcDate = dateFormatter.string(from: dt ?? Date())
        return utcDate
    }
    
    func UTCToLocal() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        dateFormatter.timeZone = DateFormats.UTC_TIME_ZONE
        dateFormatter.locale = DateFormats.EN_US_POSIX
        let dt = dateFormatter.date(from: self)
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = DateFormats.DATE_TIME_FORMAT
        let localDate = dateFormatter.string(from: dt ?? Date())
        return localDate
    }
    
    func getScheduleDateStr() -> String {
        if var firstPart = self.components(separatedBy: "T").first {
            firstPart = firstPart + "T00:00:00"
            return firstPart
        } else {
            return self
        }
    }
    
    func getMyCardsDateStr() -> String {
        let localDate = self.getLocalDate()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = DateFormats.MY_CARDS_DATE_FORMAT
        let resultStr = dateFormater.string(from: localDate)
        return resultStr
    }
    
    func getSechduledCardsDate() -> String {
        let localDate = self.getLocalDate()
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = DateFormats.MMMddyyyy
        let resultStr = dateFormater.string(from: localDate)
        return resultStr
    }
    
    func convertHtml() -> NSMutableAttributedString{
        guard data(using: .utf8) != nil else { return NSMutableAttributedString() }
        do{
            let modifiedFont = "<span style=\"font-family: Helvetica; font-size: 14\">\(self)</span>"
            let attrStr = try NSMutableAttributedString(
                data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
                options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil)
            
            let paragraph = NSMutableParagraphStyle()
            paragraph.lineBreakMode = .byTruncatingTail
            attrStr.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraph, range: NSMakeRange(0, attrStr.length))
            let colorAttribute = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)]
            attrStr.addAttributes(colorAttribute, range: NSMakeRange(0, attrStr.length))
            return attrStr
        } catch _{
            return NSMutableAttributedString()
        }
    }
    
    func isPhoneNumber(strContactNo:String) -> Bool
    {
        let regex: NSString = "\\+?[0-9]{10,13}"
        let predicate:NSPredicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailCheck = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailCheck.evaluate(with: self)
    }
    
    func isValidURL() -> Bool {
        var isValid = false

        if !self.contains("..") {
            let head       = "((http|https)://)?([(w|W)]{3}+\\.)?"
            let tail       = "\\.+[A-Za-z]{2,3}+(\\.)?+(/(.)*)?"
            let urlRegEx = head+"+(.)+"+tail
            let urlTest = NSPredicate(format:"SELF MATCHES %@", urlRegEx)
            isValid = urlTest.evaluate(with: self.trimmingCharacters(in: CharacterSet.whitespaces))
        }
        return isValid
    }
    
    func whiteSpacesRemoved() -> String {
        return self.filter { $0 != Character(" ") }
    }
}
