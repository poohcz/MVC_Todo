import Foundation

class InsertViewModel {
    
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
    
    func listInsert(title: String, detail: String) {
        list.append(TestModel(id: 0, userId: 0, body: title, title: detail))
    }

}
