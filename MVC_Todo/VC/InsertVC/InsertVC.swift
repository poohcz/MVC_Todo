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
        
        if let savedData = UserDefaults.standard.object(forKey: UserDefaultsManager.keyApiList) as? Data {
            
            list = CodableManager.operateDecode(savedData) 
            
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func brnAddAction(_ sender: Any) {
        
        print("befor list : \(list)")
        
        list.append(TestModel(id: 0, userId: 0, body: txfTitle.text ?? "", title: txfDetail.text ?? ""))
        
        // 담는거1
        let encoded = CodableManager.operateEncode(self.list)
        UserDefaultsManager.set(encoded, forKey: UserDefaultsManager.keyApiList)
        print("after list : \(list)")
    }
    
}
