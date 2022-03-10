//
//  WebService.swift
//  VehicleApp
//
//  Created by manju V on 10/03/22.
//

import Foundation
public class WebService{
    
    let network = NetworkManager()
    /**
     Fetch News Api
     
     - Parameters:
     - Nil
     
     - Returns: News Articles data with Title and Description
     */
    
    func getAllList(url:URL,completion: @escaping ([Vehicle]? )->()){
        
        network.makeRequestCall(toURL: url, withHttpMethod: .get) { (results) in
            if let _ = results.data, let _ = results.response {
                if let data = results.data{
                                print(data)
                                let vehicleList = try? JSONDecoder().decode(VehicleList.self, from: data)
                
                                if vehicleList != nil{
                                    completion(vehicleList?.results)
                                }
                            }
            }
        }

        
    }
}
