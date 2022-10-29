import Foundation
import RealmSwift

class TestResult: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var user: User?
    @Persisted var test: Test?
    @Persisted var result = 0
    
    convenience init(user: User, test: Test, result: Int) {
        self.init()
        self.id = try! Realm().objects(TestResult.self).count
        self.user = user
        self.test = test
        self.result = result
    }
}
