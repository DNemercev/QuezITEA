import UIKit
import RealmSwift

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet var textFiledOutletCollection: [UITextField]!
    let defaultBorderColor = UIColor(#colorLiteral(red: 0.554305017, green: 0.554305017, blue: 0.554305017, alpha: 0.5))
    let errorBorderColor = UIColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 0.5))
    var allTests: AllTests?
    
    
    override func viewDidLoad() {
        
        for textFiled in textFiledOutletCollection {
            textFiled.layer.borderWidth = 1.0
            textFiled.layer.cornerRadius = 5
            textFiled.layer.borderColor = defaultBorderColor.cgColor
        }
        super.viewDidLoad()
        
    }
    
    @IBAction func letsGoButtonIsPressed(_ sender: Any) {
        createNewUser(name: userNameTextField.text ?? "",
                      password: passwordTextField.text ?? "",
                      confirmPassword: confirmPasswordTextField.text ?? "")
    }
    func isCorrectPassword(password: String, confirmPassword: String) -> Bool {
        password == confirmPassword
    }
    func checkTextFields() -> Bool{
        if userNameTextField.text == "" {
            showAlert(title: "Error", message: "enter user name")
            userNameTextField.layer.borderColor = errorBorderColor.cgColor
            return false
        } else {
            userNameTextField.layer.borderColor = defaultBorderColor.cgColor
        }
        if passwordTextField.text == "" {
            showAlert(title: "Error", message: "enter password")
            passwordTextField.layer.borderColor = errorBorderColor.cgColor
            return false
        } else {
            passwordTextField.layer.borderColor = defaultBorderColor.cgColor
        }
        if confirmPasswordTextField.text == "" {
            showAlert(title: "Error", message: "re-enter the password")
            confirmPasswordTextField.layer.borderColor = errorBorderColor.cgColor
            return false
        }
        if passwordTextField.text != confirmPasswordTextField.text {
            showAlert(title: "Error", message: "passwords don't match")
            passwordTextField.layer.borderColor = errorBorderColor.cgColor
            confirmPasswordTextField.layer.borderColor = errorBorderColor.cgColor
            return false
        }
        return true
    }
    
    func createNewUser(name: String, password: String, confirmPassword: String) {
        let realm = try! Realm()
        
        if checkTextFields() {
            if (realm.objects(User.self).where { $0.login == name }).isEmpty {
                do {
                    try realm.write {
                        let newUser = User(login: name, password: password, id: realm.objects(User.self).count)
                        realm.add(newUser)
                    }
                } catch {}
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let listOfTestsViewController = storyboard.instantiateViewController(withIdentifier: "ListOfTestsViewController") as? ListOfTestsViewController {
                    listOfTestsViewController.allTests = allTests
                    self.present(listOfTestsViewController, animated: false)
                }
            } else {
                showAlert(title: "Errore", message: "User with that name already exists")
            }
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
