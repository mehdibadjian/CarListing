//
//  AddViewController.swift
//  CarListing
//
//  Created by Mehdi on 24/07/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
  let carObject : CarObject? = nil
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var typeTF: UITextField!
  @IBOutlet weak var priceTF: UITextField!
 
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Add"
  }
  
  @IBAction func BtnSaveSelected(_ sender: Any) {
    if self.carObject == nil {
      //new data
      HomeDataModel().addNewCar(name: typeTF.text!,
                                price: priceTF.text!,
                                date: Date())
    }
    else {
      //update data
      HomeDataModel().editCar(name: typeTF.text!,
                              price: priceTF.text!,
                              date: Date(),
                              id: (self.carObject?.id)!)
    }
    self.navigationController?.dismiss(animated: true, completion: nil)
  }
}
