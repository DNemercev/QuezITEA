import UIKit

class ListOfTestsViewController: UIViewController {
    @IBOutlet weak var listOfTestsTableView: UITableView!
    
    var allTests: AllTests?
    var User: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadAlTests(fileUrl: "Tests")
        listOfTestsTableView.reloadData()
        listOfTestsTableView.delegate = self
        listOfTestsTableView.dataSource = self
        listOfTestsTableView.register(UINib(nibName: "ListOfTestsTableViewCell", bundle: nil), forCellReuseIdentifier: "ListOfTestsTableViewCell")
    }
}

extension ListOfTestsViewController {
    func loadAlTests (fileUrl: String) {
        do {
                if let filePath = Bundle.main.path(forResource: fileUrl, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let dataStr = try Data(contentsOf: fileUrl)
                    allTests = try JSONDecoder().decode(AllTests.self, from: dataStr)
                    listOfTestsTableView.reloadData()
                }
            } catch { }
    }
}

extension ListOfTestsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        allTests?.tests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = listOfTestsTableView.dequeueReusableCell(withIdentifier: "ListOfTestsTableViewCell", for: indexPath) as? ListOfTestsTableViewCell {
            cell.configTestCell(test: allTests?.tests?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let questionViewController = storyboard.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            questionViewController.questions = allTests?.tests?[indexPath.row].questions
            self.present(questionViewController, animated: true, completion: nil)
        }
    }
}
