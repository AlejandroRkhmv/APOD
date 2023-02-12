//
//  NetworkService.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

class NetworkService: INetworkService {
    
    let request: IRequest = Request()
    
    func requestData(urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        guard let url = URL(string: urlString) else { return }
        request.performRequest(with: url, completionHandler: completionHandler)
    }
}
