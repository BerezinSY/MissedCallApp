//
//  NetworkAPI.swift
//  MissedCallApp
//
//  Created by Stanislav BEREZIN on 20.03.2021.
//

import Foundation

protocol Networking {
    func getData(completion: @escaping ([Request]) -> Void)
}

class NetworkAPI: Networking {
    
    func getData(completion: @escaping ([Request]) -> Void) {
        requestData { (requests) in
            print(requests)
            completion(requests)
        }
    }
    
    private func requestData(completion: @escaping ([Request]) -> Void) {
        let urlString = "https://5e3c202ef2cb300014391b5a.mockapi.io/testapi"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { [unowned self] data, _, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            parse(data: data) { (requests) in
                DispatchQueue.main.async {
                    completion(requests)
                }
            }
        }.resume()
    }
    
    private func parse(data: Data, completion: @escaping ([Request]) -> Void) {
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            let requests = response.requests
            completion(requests)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
