//
//  CarObject.swift
//  CarListing
//
//  Created by Mehdi on 24/07/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import RealmSwift

class CarObject: Object {
  @objc dynamic var id : Int = 0
  @objc dynamic var name = ""
  @objc dynamic var price = ""
  @objc dynamic var updateDate = Date()
}
