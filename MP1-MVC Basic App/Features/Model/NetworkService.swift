//
//  NetworkService.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 1.05.2022.
//

import Foundation
import UIKit

protocol INetworkService {
    func fetchAllDatas(res: @escaping ([Result]) -> Void)
}

struct NetworkService: INetworkService {
    func fetchAllDatas(res: @escaping ([Result]) -> Void) {
        let url = URL(string: Constant.NetworkCostant.BASE_URL + Constant.NetworkCostant.API_KEY)
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("Error")
            }
            do {
                let jsonResult = try JSONDecoder().decode(DataModel.self, from: data!)
                //                        try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                res(jsonResult.results)
            } catch {
                print("Catch the Error")
            }
        }.resume()
    }
}

