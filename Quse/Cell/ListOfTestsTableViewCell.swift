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
    
    func changeStars(isEmptyStar: Bool) -> UIImage? {
        if isEmptyStar {
            return UIImage(systemName: "star")?.withTintColor(starColor, renderingMode: .alwaysOriginal)
        } else {
            return UIImage(systemName: "star.fill")?.withTintColor(starColor, renderingMode: .alwaysOriginal)
        }
    }

    func showRaiting(raiting: Int) {
        var fullStars = (1...5).contains(raiting) ? raiting : 0
        
        for num in 0..<5 {
            raitingStarsOutleCollection[num].image = changeStars(isEmptyStar: true)
        }
        
        while (1...5).contains(fullStars) {
            raitingStarsOutleCollection[fullStars - 1].image = changeStars(isEmptyStar: false)
            fullStars -= 1
        }
    }
    
    func configTestCell(test: Tests?) {
        showRaiting(raiting: test?.testRaiting ?? 0)
        categoryImageView.image = UIImage(systemName: test?.testGroupImage ?? "")
        testNameLabel.text = test?.testName ?? ""
    }
}
