import Foundation


class UpdateViewModel {
    
    var list = [TestModel]()
     
    func decodeList() {
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyApiList) as? Data {
            let decoded = CodableManager.operateDecode(savedData)
            list = decoded
        }
    }
    func encodeList() {
        let encoded = CodableManager.operateEncode(list)
        UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyApiList)
       
    }
    
    func listUpdate(id: Int = 0, userId: Int = 0, body: String, title: String) -> TestModel {
        return TestModel()
    }
    
    
    
}
