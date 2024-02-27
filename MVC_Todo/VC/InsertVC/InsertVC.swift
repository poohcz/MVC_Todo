//
//  InsertVC.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import Foundation
import UIKit

class InsertVC : UIViewController {
    
    @IBOutlet weak var txfTitle: CommonLineTextField!
    @IBOutlet weak var txfDetail: CommonLineTextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var model = TestModel()
    var list = [TestModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        txfTitle.textColor = .black
        txfTitle.tintColor = .black
        txfDetail.textColor = .black
        txfDetail.tintColor = .black
        
//        UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyArrayList)
        
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyArrayList) as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([TestModel].self, from: savedData) {
                print(savedObject)
                list = savedObject
            }
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func brnAddAction(_ sender: Any) {
        
        print("befor list : \(list)")
        print("befor model : \(model)")
        
        list.append(TestModel(id: 0, userId: 0, body: txfTitle.text ?? "", title: txfDetail.text ?? ""))
        
        let encoder = JSONEncoder()
        
        // 담는거1
        if let encoded = try? encoder.encode(list) {
            UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyArrayList)
        }
        print("after list : \(list)")
        print("after model : \(model)")
    }
    
}
