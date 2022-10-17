//
//  ListOfTestsTableViewCell.swift
//  Quse
//
//  Created by Nemercev Dmytro on 13.10.2022.
//

import UIKit

class ListOfTestsTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var testNameLabel: UILabel!
    @IBOutlet var raitingStarsOutleCollection: [UIImageView]!
    
    let starColor = UIColor(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func showRaiting(raiting: Int) {
        if (0...5).contains(raiting) {
            for num in 0...raiting {
                raitingStarsOutleCollection[num].image = UIImage(systemName: "star.fill")?.withTintColor(starColor, renderingMode: .alwaysOriginal)
            }
        }
    }
    
    func configTestCell(raiting: Int, testName: String, groupImage: String) {
        showRaiting(raiting: raiting)
        categoryImageView.image = UIImage(systemName: groupImage)
        testNameLabel.text = testName
    }
}
