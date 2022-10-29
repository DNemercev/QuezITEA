import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var variationsOfAnswerStackView: UIStackView!
    @IBOutlet weak var numOfQuestionLabel: UILabel!
    @IBOutlet weak var textOfQuestionLabel: UILabel!
    @IBOutlet var optionsOutletCollection: [UIButton]!
    
    
    var questions: [Questions]?
    var numOfQuestion: Int = 0
    var result: Int = 0
    var resArray: [UserResAnsver]?
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    @IBAction func selectAnsver(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if numOfQuestion < (questions?.count ?? 0) - 1 {
            if let nextQuestionViewController = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
                nextQuestionViewController.questions = self.questions
                nextQuestionViewController.numOfQuestion = self.numOfQuestion + 1
                
                self.present(nextQuestionViewController, animated: true, completion: nil)
            }
        } else if let testResultViewController = storyboard.instantiateViewController(withIdentifier: "TestResultViewController") as? TestResultViewController {
            self.present(testResultViewController, animated: true, completion: nil)
        }
    }
}

extension QuestionViewController {
    
    //MARK: show question
    func showQuestion() {
        numOfQuestionLabel.text = "\(numOfQuestion + 1)/\(Int(questions?.count ?? 0))"
        textOfQuestionLabel.text = questions?[numOfQuestion].question ?? ""
    }
    
}

struct UserResAnsver {
    let question: String
    let ansver: String
    let trueAsver: String
    
    var isTrueAnsver: Bool {
        ansver == trueAsver
    }
}
