import Foundation


class ListViewModel {
    
    var list: [TestModel] = []
    
    var listCount : Int {
        return self.list.count
    }
    
    func listInfo(index: Int) -> TestModel {
        return list[index]
    }
    
    func deleteList() {
        list.removeLast()
    }
    
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
    
}

/** 서버 통신 */
extension ListViewModel {
 
    func callApi() {
        if !UserDefaultsManager.bool(forKey: UserDefaultsManager.keyApiFirstChk) {
            UserDefaultsManager.set(true, forKey: UserDefaultsManager.keyApiFirstChk)
            D_Network.shared.fetchDataFromAPI { [weak self] (items, error) in
                guard let self = self else { return }
                
                if let error = error {
                    
                } else if let items = items {
                    list = items
                    let encoded = CodableManager.operateEncode(items)
                    UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyApiList)
                }
            }
        }
    }
    
}
