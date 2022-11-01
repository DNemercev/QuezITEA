import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPassword: UITextField!
      
    @IBOutlet weak var auitorisationButtonOutLet: UIButton!
    var allTests: AllTests?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlTests(fileUrl: "Tests")
        loadTestsInDB()
        
        print("app folder path is \(NSHomeDirectory())")
    }
    
    @IBAction func autorisationButtonIsPressed(_ sender: Any) {
        if userIsExisit(userName: userNameTextField.text ?? "",
                        password: userPassword.text ?? "") {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let listOfTestsViewController = storyboard.instantiateViewController(withIdentifier: "ListOfTestsViewController") as? ListOfTestsViewController {
                listOfTestsViewController.allTests = allTests
                show(listOfTestsViewController, sender: self)
            }
        } else {
            showAlert(title: "Error", message: "No such user exists")
        }
    }
    
    
    
    @IBAction func registerNewUserButtonIsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let registrationViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController {
            registrationViewController.allTests = allTests
            self.present(registrationViewController, animated: true, completion: nil)
        }
        
    }
    
    func userIsExisit(userName: String, password: String) -> Bool {
        
        return try! Realm().objects(User.self).where { $0.login == userName && $0.password == password }.isEmpty ? false : true
    }
    
    func createTestTabel() {
        let realm = try! Realm()
        var count = 0
        for test in allTests?.tests ?? [] {
            try! realm.write {
                realm.add(Test(name: test.testName!, raiting: 0, id: count))
            }
            count += 1
        }
    }
    
    func loadTestsInDB() {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: "isFirstLaunch") == false {
            createTestTabel()
            defaults.set(true, forKey: "isFirstLaunch")
        }
    }
    
    func loadAlTests (fileUrl: String) {
        do {
                if let filePath = Bundle.main.path(forResource: fileUrl, ofType: "json") {
                    let fileUrl = URL(fileURLWithPath: filePath)
                    let dataStr = try Data(contentsOf: fileUrl)
                    allTests = try JSONDecoder().decode(AllTests.self, from: dataStr)
                }
            } catch { }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

