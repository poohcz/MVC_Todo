//
//  InsertVC.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/19/24.
//

import Foundation
import UIKit

class InserVC : UIViewController {
    
    @IBOutlet weak var txfTitle: CommonLineTextField!
    @IBOutlet weak var txfDetail: CommonLineTextField!
    @IBOutlet weak var btnAdd: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView() {
        
    }
    
}
