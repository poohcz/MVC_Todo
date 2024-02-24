import UIKit

class UserDefaultsManager {
    
    static func set(_ value: Any, forKey: String) {
        UserDefaults.standard.set(value, forKey: forKey)
    }
    
    static func dictionary(forKey: String) -> [String: Any] {
        return UserDefaults.standard.dictionary(forKey: forKey) ?? [:]
    }
    
    static func array(forKey: String) -> [Any] {
        return UserDefaults.standard.array(forKey: forKey) ?? []
    }
    
    static func model(forKey: String) -> [TestModel]  {
        return UserDefaults.standard.value(forKey: forKey) as! [TestModel]
    }
    
}


extension UserDefaultsManager {
    /// Key
    static let keyArrayList = "Array"
}
