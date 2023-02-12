//
//  IStartInteractor.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation
import UIKit

protocol IStartInteractor: AnyObject {
    
    var networkService: INetworkService? { get set }
    var constants: Constants! { get set }
    
    func getDataForImage(completionHandler: @escaping ((Data) -> Void))
    func needData(for date: String, completionHandler: @escaping ((Apod) -> Void))
}
