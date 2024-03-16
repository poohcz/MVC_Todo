//
//  UpdateVC.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import Foundation
import UIKit

class UpdateVC : UIViewController {
    
    @IBOutlet weak var txfTitle: CommonLineTextField!
    @IBOutlet weak var txfDetail: CommonLineTextField!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var indexPath = 0
    let viewModel = UpdateViewModel()
    
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
        
        viewModel.decodeList()
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func btnUpdate(_ sender: Any) {
        
        
       // list[indexPath] = (TestModel(id: 0, userId: 0, body: txfTitle.text ?? "", title: txfDetail.text ?? ""))
        viewModel.list[indexPath] = viewModel.listUpdate(body: txfTitle.text ?? "", title: txfDetail.text ?? "")
        
        viewModel.encodeList()

    }
    
}
