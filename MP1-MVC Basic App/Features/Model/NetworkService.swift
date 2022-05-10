//
//  NetworkService.swift
//  MP1-MVC Basic App
//
//  Created by Arslan Kaan AYDIN on 1.05.2022.
//

import Foundation
import UIKit

protocol INetworkService {
    func fetchAllDatas(text: String, res: @escaping ([Result]) -> Void)
}


struct NetworkService: INetworkService {
    func fetchAllDatas(text: String, res: @escaping ([Result]) -> Void) {
        let url = URL(string: Constant.NetworkCostant.BASE_URL + Constant.NetworkCostant.API_KEY + Constant.NetworkCostant.QUERY + text)
        ;        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error != nil {
                print("Error")
            }
            do {
                let jsonResult = try JSONDecoder().decode(DataModel.self, from: data!)
                res(jsonResult.results)
            } catch {
                print("Catch the Error")
            }
        }.resume()
    }
}

