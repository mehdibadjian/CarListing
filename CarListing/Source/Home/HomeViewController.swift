//
//  ViewController.swift
//  CarListing
//
//  Created by Mehdi on 24/07/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

extension DateFormatter {
  static var sharedDateFormatter: DateFormatter = {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    return dateFormatter
  }()
}

class HomeViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //view initializer
    self.title = "Home"
    self.view.backgroundColor = .white
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    //fetch cars
    HomeDataModel.sharedInstance.fetchCars()
    //table related initializer
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.register(ListingCarTableViewCell.self, forCellReuseIdentifier: ListingCarTableViewCell.identifier)
  }
  
  @objc func addTapped() {
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let tabbarViewController = storyBoard.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
    self.present(tabbarViewController, animated: true, completion: nil)
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return HomeDataModel.sharedInstance.numberOfSections()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return HomeDataModel.sharedInstance.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 110
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let object = HomeDataModel.sharedInstance.objectForIndex(index: indexPath.row)
    let cell = tableView.dequeueReusableCell(withIdentifier: ListingCarTableViewCell.identifier, for: indexPath) as! ListingCarTableViewCell
    cell.carLabel.text = object.name
    cell.priceLabel.text = "$ "+object.price
    cell.dateAddedLabel.text = DateFormatter.sharedDateFormatter.string(from: object.updateDate)
    cell.iconImageView.image = UIImage.init(named: "car-placeholder")
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}




