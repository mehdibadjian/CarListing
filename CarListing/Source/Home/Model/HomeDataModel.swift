//
//  HomeDataModel.swift
//  CarListing
//
//  Created by Mehdi on 24/07/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import RealmSwift

class HomeDataModel: NSObject {
  
  var dataModel : [CarObject]? = nil
  
  // MARK: - Shared Instance
  static let sharedInstance: HomeDataModel = {
    let instance = HomeDataModel()
    return instance
  }()
  
  func fetchCars(){
    let realm = try! Realm()
    let carObjects = realm.objects(CarObject.self)
    self.dataModel = (carObjects.count == 0) ? [] : Array(carObjects)
  }
  
  func addNewCar(name: String, price: String, date: Date) {
    let car = CarObject()
    car.name = name
    car.price = price
    car.updateDate = Date()

    let realm = try! Realm()
    try! realm.write {
      realm.add(car)
    }
  }
  
  func editCar(name: String, price: String, date: Date, id: Int) {
    let realm = try! Realm()
    let cars = realm.objects(CarObject.self).filter("id = %@", id)
    
    if let car = cars.first {
      try! realm.write {
        car.name = name
        car.price = price
        car.updateDate = Date()
      }
    }
  }
  
  func numberOfRows() -> Int {
    return (self.dataModel?.count)!
  }
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func objectForIndex(index : Int) -> CarObject{
    return self.dataModel![index]
  }
  
}
