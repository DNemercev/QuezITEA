import UIKit
import RealmSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPassword: UITextField!
      
    @IBOutlet weak var auitorisationButtonOutLet: UIButton!
    var allTests: AllTests?
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAlTests(fileUrl: "Tests")
        loadTestsInDB()
    }
    
    @IBAction func autorisationButtonIsPressed(_ sender: Any) {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let listOfTestsViewController = storyboard.instantiateViewController(withIdentifier: "ListOfTestsViewController") as? ListOfTestsViewController {
            listOfTestsViewController.allTests = allTests
            self.present(listOfTestsViewController, animated: true, completion: nil)
        }
    }
    
    
    
    @IBAction func registerNewUserButtonIsPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let listOfTestsViewController = storyboard.instantiateViewController(withIdentifier: "RegistrationViewController") as? RegistrationViewController {
            
            
            
            self.present(listOfTestsViewController, animated: true, completion: nil)
        }
        
    }
    
    func autoriseUser(userName: String) {
        let realm = try! Realm()
        
        if let user = realm.object(ofType: User.self, forPrimaryKey: userName) {
            self.user = user
        } else {
            let newUserId = realm.objects(User.self).count
            let user = User(login: userName, password: "123", id: newUserId)
            self.user = user
            try! realm.write {
                realm.add(user)
            }
        }
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
    
    
}

