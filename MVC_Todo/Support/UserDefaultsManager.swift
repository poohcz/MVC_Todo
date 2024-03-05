import UIKit

class UserDefaultsManager {
    
    static func set(_ value: Any, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    static func bool(forKey: String) -> Bool {
        return UserDefaults.standard.bool(forKey: forKey)
    }
    
    static func data(forKey: String) -> Data? {
        return UserDefaults.standard.data(forKey: forKey)
    }
    
    static func string(forKey: String) -> String {
        return UserDefaults.standard.string(forKey: forKey) ?? ""
    }
    
}


extension UserDefaultsManager {
    /// Key
    static let keyApiList = "APILIST"
    static let keyApiFirstChk = "BoolValue"
}
