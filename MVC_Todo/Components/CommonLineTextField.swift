//
//  UITextField.swift
//  MVC_Todo
//
//  Created by 장진호 on 2024/02/20.
//

import UIKit

class CommonLineTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        
        self.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: self.frame.size.height-1, width: self.frame.width, height: 1)
        border.backgroundColor = UIColor.black.cgColor
        self.layer.addSublayer(border)
        self.textAlignment = .center
        self.textColor = UIColor.black
    }
    
}
