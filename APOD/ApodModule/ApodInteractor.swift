//
//  ApodInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import UIKit

class ApodInteractor: IApodInteractor {
    
    var constant: Constants! = Constants()
    var networkService: INetworkService?
    internal var cache: NSCache<AnyObject, UIImage>! = NSCache<AnyObject, UIImage>()
    
    init(networkService: INetworkService?) {
        self.networkService = networkService
    }
    
    func getDataImage(urlString: String, completionHandler: @escaping ((Data) -> Void)) {
        networkService?.requestData(urlString: urlString, completionHandler: completionHandler)
    }
    
    func saveToCache(image: UIImage, date: String) {
        cache.setObject(image, forKey: date as AnyObject)
    }
    
    func loadFromCache(date: String) -> UIImage {
        guard let image = cache.object(forKey: date as AnyObject) else { return UIImage() }
        return image
    }
}
