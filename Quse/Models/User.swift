import Foundation
import RealmSwift

class Dog: Object {
    @Persisted var name = ""
    @Persisted var testResId: Int?
}
