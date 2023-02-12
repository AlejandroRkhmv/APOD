//
//  IApodInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

protocol IApodInteractor: AnyObject {
    
    var networkService: INetworkService? { get set }
    var constant: Constants! { get }
    func getDataImage(urlString: String, completionHandler: @escaping ((Data) -> Void))
}
