//
//  UserStatistic.swift
//  Quse
//
//  Created by Nemercev Dmytro on 14.10.2022.
//

import Foundation
import RealmSwift

class UserStatistic: Object {
    @Persisted var id: Int
    @Persisted var testResultId: Int?
}
