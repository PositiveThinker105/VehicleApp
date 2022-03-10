//
//  VehicleViewModel.swift
//  VehicleApp
//
//  Created by manju V on 10/03/22.
//

import Foundation

struct VehicleVListiewModel {
    let vehicleList : [Vehicle]
    
}

extension VehicleVListiewModel{
    var numberOfSections:Int{
        return 1
    }
    
    func numberOfRowsInSection(_section:Int) -> Int {
        return self.vehicleList.count
    }
    
    func vehicleAtIndex(_index:Int) -> VehicleViewModel {
        let vehicle = self.vehicleList[_index]
        return VehicleViewModel(vehicle)
    }
}

struct VehicleViewModel{
    private let vehicle:Vehicle
}
extension VehicleViewModel{
    init(_ vehicle:Vehicle) {
        self.vehicle = vehicle
    }
}

extension VehicleViewModel{
    var name:String{
        return self.vehicle.name
    }
    
    var model:String{
        return self.vehicle.model
    }
}
