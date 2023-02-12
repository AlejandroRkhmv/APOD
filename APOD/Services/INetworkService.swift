//
//  INetworkService.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

protocol INetworkService: AnyObject {
    func requestData(urlString: String, completionHandler: @escaping ((Data) -> Void))
}
