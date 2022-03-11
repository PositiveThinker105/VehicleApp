//
//  LaunchingViewController.swift
//  VehicleApp
//
//  Created by manju V on 11/03/22.
//

import Foundation
import UIKit
class LaunchingViewController:UIViewController{

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.startAnimating()
    }


}
