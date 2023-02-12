//
//  StartInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import UIKit

class StartInteractor: IStartInteractor {
    
    var networkService: INetworkService?
    var constants: Constants! = Constants()
    let parseJson = ParseJSON()
    
    init(networkService: INetworkService?) {
        self.networkService = networkService
    }
    
    func getDataForImage(completionHandler: @escaping ((Data) -> Void)) {
        networkService?.requestData(urlString: constants.startImageUrlString[constants.imageIndex], completionHandler: completionHandler)
    }
    
    func needData(for date: String, completionHandler: @escaping ((Apod) -> Void)) {
        let urlString = "https://api.nasa.gov/planetary/apod?date=\(date)&api_key=\(constants.nasaApiKey)"
        networkService?.requestData(urlString: urlString) { [weak self] data in
            guard let self = self else { return }
            self.parseJson.parseJSON(with: data) { apodData in
            guard let apod = Apod(data: apodData) else { return }
            completionHandler(apod)
            }
        }
    }
}
