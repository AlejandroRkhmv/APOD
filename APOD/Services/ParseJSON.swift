//
//  ParseJSON.swift
//  APODs
//
//  Created by Александр Рахимов on 09.02.2023.
//

import Foundation

protocol IParseJSON {
    func parseJSON(with data: Data, completionHandler: @escaping ((ApodAPI) -> Void))
}

class ParseJSON: IParseJSON {
    func parseJSON(with data: Data, completionHandler: @escaping ((ApodAPI) -> Void)) {
        let decoder = JSONDecoder()
        
        guard let apodData = try? decoder.decode(ApodAPI.self, from: data) else {
            print("Can not decode data")
            return
        }
        completionHandler(apodData)
    }
}
