//
//  WebService.swift
//  VehicleApp
//
//  Created by manju V on 10/03/22.
//

import Foundation
public class WebService{
    
    private var urlString: String
    private var urlSession:URLSession

    init(urlString:String,urlSession:URLSession = .shared){
        self.urlString = urlString
        self.urlSession = urlSession

    }
    /**
     Fetch Vehicle Api
     
     - Parameters:
     - Nil
     
     - Returns: Load vehicle details with name and model
     */
    
    func getAllList(completion: @escaping ([Vehicle]? )->()){

        guard let url = URL(string: urlString)else{
            return
        }

        let request = URLRequest(url: url)
        let dataTask = urlSession.dataTask(with: request){ data,response,error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data{
                print(data)
                let vehicleList = try? JSONDecoder().decode(VehicleList.self, from: data)

                if vehicleList != nil{
                    completion(vehicleList?.results)
                }
            }
            }
        dataTask.resume()

    }

}
