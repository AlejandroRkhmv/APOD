//
//  ApodInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

class ApodInteractor: IApodInteractor {
    
    var constant: Constants! = Constants()
    var networkService: INetworkService?
    
    init(networkService: INetworkService?) {
        self.networkService = networkService
    }
    
    func getDataImage(urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService?.requestData(urlString: urlString, completionHandler: completionHandler)
    }
}
