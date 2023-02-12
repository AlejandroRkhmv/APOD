//
//  IApodInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import UIKit

protocol IApodInteractor: AnyObject {
    
    var networkService: INetworkService? { get set }
    var constant: Constants! { get }
    var cache: NSCache<AnyObject, UIImage>! { get set }
    func getDataImage(urlString: String, completionHandler: @escaping ((Data) -> Void))
    func saveToCache(image: UIImage, date: String)
    func loadFromCache(date: String) -> UIImage
}
