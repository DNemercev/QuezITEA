import UIKit

class QuestionsResultTableViewCell: UITableViewCell {
    
    let falseColor = UIColor(#colorLiteral(red: 1, green: 0.4054048657, blue: 0.423035264, alpha: 1))
    let trueColor = UIColor(#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userAnswerLabel: UILabel!
    @IBOutlet weak var trueAnswerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(questionStr: String, userAnswer: String, trueAnswer: String) {
        userAnswerLabel.text = userAnswer
        if userAnswer == trueAnswer {
            trueAnswerLabel.isHidden = true
            userAnswerLabel.backgroundColor = trueColor
        } else {
            trueAnswerLabel.text = trueAnswer
            userAnswerLabel.backgroundColor = falseColor
            trueAnswerLabel.backgroundColor = trueColor
        }
    }
}
