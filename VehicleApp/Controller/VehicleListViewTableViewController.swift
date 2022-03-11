//
//  VehicleListViewTableViewController.swift
//  VehicleApp
//
//  Created by manju V on 09/03/22.
//

import Foundation
import UIKit

class VehicleListViewTableViewController: UITableViewController {
    
    private var vehicleListVM :VehicleVListiewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Vehicle"
        setUp()
    }
    

    /**
     Seup function to fetch details from Api and load table
     
     - Parameters:
     - Nil
     
     - Returns:  data Loaded with name and model from vehicleList
     */
    
    // MARK: - SETUP
    func setUp(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        WebService(urlString: VehicleConstants.vehicleServiceURLString).getAllList(){articles in
            
            if let articles = articles{
                self.vehicleListVM = VehicleVListiewModel(vehicleList: articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    // MARK: Tableview Datasource ad Delegates
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.vehicleListVM == nil ? 0:self.vehicleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vehicleListVM.numberOfRowsInSection(_section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleTableViewCell", for: indexPath) as? VehicleListViewTableViewCell else{
            fatalError("data")
        }
        
        let vehicleVM = self.vehicleListVM.vehicleAtIndex(_index: indexPath.row)
        cell.nameLabel.text = vehicleVM.name
        cell.modelLabel.text = vehicleVM.model
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                return UITableView.automaticDimension
            }
    

}

