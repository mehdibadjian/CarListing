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
    instance.fetchCars()
    return instance
  }()
  
  func fetchCars(){
    let realm = try! Realm()
    let carObjects = realm.objects(CarObject.self)
    self.dataModel = (carObjects.count == 0) ? [] : Array(carObjects)
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
