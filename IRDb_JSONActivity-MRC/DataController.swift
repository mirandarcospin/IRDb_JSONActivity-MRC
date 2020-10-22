//
//  DataController.swift
//  IRDb_JSONActivity-MRC
//
//  Created by Miranda Ramirez Cospin on 10/22/20.
//

import UIKit

class DataController: NSObject {
    
    let JSONURL = "https://api.jsonbin.io/b/5eb061a247a2266b1472bcf9/1"
    
    var dataModel: MediaDataModel?
    
    func getJSONData(completion: @escaping (_ dataModel: MediaDataModel) -> ()){
        
        let jsonUrl = URL(string: JSONURL)
        
        let dataTask = URLSession.shared.dataTask(with: jsonUrl!) {
            (data, response, error) in
            
            guard let thisData = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let thisMediaData = try decoder.decode(MediaDataModel.self, from: thisData)
                
                self.dataModel = thisMediaData
                print(thisMediaData.franchise)
                
            } catch let err {
                print("Error was: ", err)
            }
            
            // call back the completionHandler and let them know we are done
            
            //go back to the main thread
            DispatchQueue.main.async {
                completion(self.dataModel!)
            }
            
        }
        dataTask.resume()
    }
}
