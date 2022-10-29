import Foundation
import RealmSwift

class Test: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name = ""
    @Persisted var raiting = 0
    
    convenience init(name: String, raiting: Int, id: Int) {
        self.init()
        self.id = id
        self.name = name
        self.raiting = raiting
    }
    
}
