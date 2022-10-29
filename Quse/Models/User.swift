import Foundation
import RealmSwift

class User: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var login = ""
    @Persisted var password = ""
    
    convenience init(login: String, password: String, id: Int) {
        self.init()
        self.id = id
        self.login = login
        self.password = password
    }
}
