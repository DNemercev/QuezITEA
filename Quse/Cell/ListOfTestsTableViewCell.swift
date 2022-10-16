//
//  ListOfTestsTableViewCell.swift
//  Quse
//
//  Created by Nemercev Dmytro on 13.10.2022.
//

import UIKit

class ListOfTestsTableViewCell: UITableViewCell {

//    let testInfo: TestInfo?
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var testNameLabel: UILabel!
    @IBOutlet weak var starsRaitingStack: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
