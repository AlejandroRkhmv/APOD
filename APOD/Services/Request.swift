//
//  Request.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import UIKit

protocol IRequest: AnyObject {
    func performRequest<T>(with url: URL, completionHandler: @escaping ((T) -> Void))
}

class Request: IRequest {
    func performRequest<T>(with url: URL, completionHandler: @escaping ((T) -> Void)) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let data = data else { return }
            guard let data = data as? T else { return }
            DispatchQueue.main.async {
                completionHandler(data)
            }
        }
        task.resume()
    } 
}

