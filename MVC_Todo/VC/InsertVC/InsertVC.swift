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
    
    let viewModel = InsertViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        txfTitle.textColor = .black
        txfTitle.tintColor = .black
        txfDetail.textColor = .black
        txfDetail.tintColor = .black
         
        viewModel.decodeList()
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func brnAddAction(_ sender: Any) {
        viewModel.listInsert(title: txfTitle.text ?? "", detail: txfDetail.text ?? "")
        viewModel.encodeList()
    }
    
}
