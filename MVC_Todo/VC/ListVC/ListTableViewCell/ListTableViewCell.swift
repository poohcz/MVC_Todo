//
//  ListTableViewCell.swift
//  MVC_Todo
//
//  Created by 김동율 on 2/21/24.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfo(info: TestModel) {
        idLabel.text = String(info.id)
        userIdLabel.text = String(info.userId)
        titleLabel.text = String(info.title)
        bodyLabel.text = String(info.body)
    }
    
}
