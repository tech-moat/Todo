//
//  Memo.swift
//  Todo
//
//  Created by 堀弘昌 on 2022/09/07.
//

import Foundation
import RealmSwift

class Memo: Object{
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var date: String = ""
}
